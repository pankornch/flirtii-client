import 'package:flirtii/models/chat.dart';
import 'package:flirtii/screens/chats/widgets/card.dart';
import 'package:flirtii/screens/chats/widgets/navbar.dart';
import 'package:flirtii/services/gql/query.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return GraphQLConsumer(builder: (GraphQLClient client) {
      return Query(
        options: QueryOptions(
          document: GET_ALL_CHATS,
          pollInterval: Duration(seconds: 5),
        ),
        builder: (result, {fetchMore, refetch}) {
          if (result.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );

          final List<Chat> chats = [];

          for (var chat in result.data!["chats"]) {
            chats.add(Chat.fromJson(chat));
          }

          return Scaffold(
            body: Column(
              children: [
                ChatNavBar(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: ListView(
                      children: [
                        for (var _chat in chats)
                          ChatCard(
                            chat: _chat,
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );
    });
  }
}
