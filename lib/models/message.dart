import 'package:flirtii/models/user.dart';

class Message {
  late String? id;
  late User? user;
  late String? text;
  late DateTime? createdAt;
  late DateTime? updatedAt;

  Message({this.id, this.user, this.text, this.createdAt, this.updatedAt});
}
