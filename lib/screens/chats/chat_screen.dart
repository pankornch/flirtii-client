import 'package:flirtii/models/chat.dart';
import 'package:flirtii/models/message.dart';
import 'package:flirtii/models/user.dart';
import 'package:flirtii/screens/chats/widgets/card.dart';
import 'package:flirtii/screens/chats/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final r = gql(r"""
    query {
      me {
        _id
      }

      chats {
        _id
        users {
          _id
          email
          firstName
          lastName
          avatar
        }
        message {
          text
        }
      }
    }
    """);

  @override
  Widget build(BuildContext context) {
    return GraphQLConsumer(builder: (GraphQLClient client) {
      return Query(
        options: QueryOptions(
          document: r,
          pollInterval: Duration(seconds: 3),
        ),
        builder: (result, {fetchMore, refetch}) {
          final List<Chat> _chats = [];
          final data = result.data?["chats"];
          final me = result.data?["me"];

          if (!result.isLoading) {
            for (var i = 0; i < data.length; i++) {
              final d = data[i];
              _chats.add(
                Chat(
                  id: d["_id"],
                  message: Message(text: d["message"]["text"]),
                  users: [
                    User(
                      email: d["users"][0]["email"],
                      avatar: d["users"][0]["avatar"],
                      firstName: d["users"][0]["firstName"],
                      lastName: d["users"][0]["lastName"],
                    ),
                    User(
                      email: d["users"][1]["email"],
                      avatar: d["users"][1]["avatar"],
                      firstName: d["users"][1]["firstName"],
                      lastName: d["users"][1]["lastName"],
                    ),
                  ],
                ),
              );
              late User _friend;

              for (var u in d["users"]) {
                if (u["_id"] != me["_id"]) {
                  final _f = u;
                  _friend = User(
                    id: _f["_id"],
                    email: _f["email"],
                    avatar: _f["avatar"],
                    firstName: _f["firstName"],
                  );
                  break;
                }
              }

              _chats[i].friend = _friend;
            }
          }

          return Scaffold(
            body: result.isLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      ChatNavBar(),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          child: ListView(
                            children: [
                              for (int i = 0; i < _chats.length; i++)
                                ChatCard(
                                  chat: _chats[i],
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
