import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/models/chat.dart';
import 'package:flirtii/models/message.dart';
import 'package:flirtii/models/user.dart';
import 'package:flirtii/screens/chats/chat_by_id/widgets/bottom_bar.dart';
import 'package:flirtii/screens/chats/chat_by_id/widgets/text_card.dart';
import 'package:flirtii/services/gql/mutation.dart';
import 'package:flirtii/services/gql/query.dart';
import 'package:flirtii/shared/CircleContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ChatByIdScreen extends StatefulWidget {
  ChatByIdScreen({Key? key}) : super(key: key);

  @override
  _ChatByIdScreenState createState() => _ChatByIdScreenState();
}

class _ChatByIdScreenState extends State<ChatByIdScreen> {
  ScrollController _scrollController = new ScrollController();

  final q = gql(r"""
      query($input: GetChatInput!) {
        me {
          _id
        }
        chat(input: $input) {
          _id
          users {
            _id
            email
            avatar
            firstName
            lastName
          }
          messages {
            user {
              _id
              email
            }
            text
          }
        }
      } 
    """);

  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: GET_CHAT_BY_ID,
        variables: {
          "input": {"id": Get.parameters["id"]}
        },
        pollInterval: Duration(seconds: 2),
      ),
      builder: (result, {fetchMore, refetch}) {
        if (result.isLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final chat = Chat.fromJson(result.data!["chat"]);

        final img = "https://i.pravatar.cc/150?u";

        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: kMainPurpleColor,
            title: Row(
              children: [
                CircleContainer(
                  size: 40,
                  child: Image.network(
                    "$img=${chat.friend?.id}",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                    "${chat.friend?.firstName ?? ''} ${chat.friend?.lastName ?? ''}"),
              ],
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              child: ListView(
                reverse: true,
                controller: _scrollController,
                children: [
                  for (var _message in chat.messages!)
                    _message.user!.id == chat.friend!.id
                        ? ChatTextCardSender(message: _message)
                        : ChatTextCardRecipent(message: _message),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Mutation(
            options: MutationOptions(
              document: SEND_CHAT,
              onCompleted: (data) {
                // refetch!();
              },
              onError: (error) {
                print(error);
              },
            ),
            builder: (runMutation, _) => ChatBottomBar(
              onSubmit: (String text) => runMutation({
                "input": {
                  "recipient": chat.friend!.id,
                  "text": text,
                }
              }),
            ),
          ),
        );
      },
    );
  }
}
