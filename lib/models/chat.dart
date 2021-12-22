import 'package:flirtii/models/message.dart';
import 'package:flirtii/models/user.dart';

class Chat {
  late String? id;
  late List<User>? users;
  late User? friend;
  late Message? lastMessage;
  late List<Message>? messages;
  late DateTime? createdAt;
  late DateTime? updatedAt;

  Chat({
    this.id,
    this.users,
    this.lastMessage,
    this.messages,
    this.updatedAt,
    this.createdAt,
    this.friend,
  });
  Chat.fromJson(Map<String, dynamic> json) {
    this.id = json["_id"];
    // this.users = json["users"];
    this.lastMessage = json["lastMessage"] != null
        ? Message.fromJson(json["lastMessage"])
        : null;
    this.messages =
        json["messages"] != null ? Message().fromList(json["messages"]) : null;
    this.updatedAt = json["updatedAt"];
    this.createdAt = json["createdAt"];
    this.friend = json["friend"] != null ? User.fromJson(json["friend"]) : null;
  }
}
