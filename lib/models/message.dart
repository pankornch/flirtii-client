import 'package:flirtii/models/user.dart';

class Message {
  late String? id;
  late User? user;
  late String? text;
  late DateTime? createdAt;
  late DateTime? updatedAt;

  Message({this.id, this.user, this.text, this.createdAt, this.updatedAt});

  Message.fromJson(Map<String, dynamic> json) {
    this.id = json["_id"];
    this.user = json["user"] != null ? User.fromJson(json["user"]) : null;
    this.text = json["text"];
  }

  fromList(List<dynamic> list) {
    final List<Message> _messages = [];

    for (var l in list) {
      _messages.add(Message.fromJson(l));
    }

    return _messages;
  }
}
