import 'package:flirtii/configs/constants.dart';
import 'package:flirtii/models/chat.dart';
import 'package:flirtii/models/message.dart';
import 'package:flirtii/models/user.dart';
import 'package:flirtii/screens/chats/chat_by_id/widgets/bottom_bar.dart';
import 'package:flirtii/screens/chats/chat_by_id/widgets/text_card.dart';
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
    return GraphQLConsumer(
      builder: (GraphQLClient client) {
        return Query(
          options: QueryOptions(
            document: q,
            variables: {
              "input": {"id": Get.parameters["id"]}
            },
            pollInterval: Duration(seconds: 2),
          ),
          builder: (result, {fetchMore, refetch}) {
            final data = result.data?["chat"];
            final me = result.data?["me"];
            User _user = User();

            Chat _chat = Chat();

            final img = "https://i.pravatar.cc/150?u";

            if (!result.isLoading) {
              _chat = Chat(id: data["_id"]);
              _user = User(id: me["_id"]);

              for (var u in data["users"]) {
                if (u["_id"] != me["_id"]) {
                  final _f = u;
                  _chat.friend = User(
                    id: _f["_id"],
                    email: _f["email"],
                    avatar: _f["avatar"],
                    firstName: _f["firstName"],
                    lastName: _f["lastName"],
                  );
                  break;
                }
              }

              _chat.messages = [];
              for (var m in data["messages"]) {
                _chat.messages!.add(
                  Message(
                      user: User(
                        id: m["user"]["_id"],
                        email: m["user"]["email"],
                      ),
                      text: m["text"]),
                );
              }
            }

            onSubmit(GraphQLClient client, String text) async {
              final q = gql(r"""
                mutation($input: SendChatInput!) {
                  sendChat(input: $input) {
                    message {
                      text
                    }
                  }
                }
              """);

              await client.mutate(
                MutationOptions(
                  document: q,
                  variables: {
                    "input": {
                      "text": text,
                      "recipient": _chat.friend!.id,
                    }
                  },
                ),
              );

              refetch!();
            }

            return Scaffold(
              appBar: AppBar(
                centerTitle: false,
                backgroundColor: kMainPurpleColor,
                title: Row(
                  children: [
                    CircleContainer(
                      size: 40,
                      child: Image.network(
                        "$img=${_chat.friend?.id}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                        "${_chat.friend?.firstName ?? ''} ${_chat.friend?.lastName ?? ''}"),
                  ],
                ),
              ),
              body: result.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        child: ListView(
                          reverse: true,
                          controller: _scrollController,
                          children: [
                            for (var i = 0; i < _chat.messages!.length; i++)
                              _user.id == _chat.messages![i].user!.id
                                  ? ChatTextCardRecipent(
                                      message: _chat.messages![i])
                                  : ChatTextCardSender(
                                      message: _chat.messages![i],
                                    )
                          ],
                        ),
                      ),
                    ),
              bottomNavigationBar: ChatBottomBar(
                  onSubmit: (String text) => onSubmit(client, text)),
            );
          },
        );
      },
    );
  }
}
