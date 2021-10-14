import 'package:flirtii/models/message.dart';
import 'package:flirtii/models/user.dart';

class Chat {
  late String? id;
  late List<User>? users;
  late User? friend;
  late Message? message;
  late List<Message>? messages;
  late DateTime? createdAt;
  late DateTime? updatedAt;

  Chat(
      {this.id,
      this.users,
      this.message,
      this.messages,
      this.updatedAt,
      this.createdAt,
      this.friend});
}
