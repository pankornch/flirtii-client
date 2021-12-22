import 'package:flirtii/models/user.dart';

class Like {
  late String? id;
  late User? source;
  late User? target;
  late DateTime? createdAt;
  late DateTime? updatedAt;
  late bool? matched;

  Like({
    this.id,
    this.source,
    this.target,
    this.createdAt,
    this.matched,
    this.updatedAt,
  });

  Like.fromJson(Map<String, dynamic> json) {
    this.id = json["_id"];
    this.source = json["source"] != null ? User.fromJson(json["source"]) : null;
    this.target = json["target"] != null ? User.fromJson(json["target"]) : null;
    this.matched = json["matched"];
  }

  List<Like> fromList(List<dynamic> list) {
    final List<Like> likes = [];
    for (var l in list) {
      likes.add(Like.fromJson(l));
    }

    return likes;
  }

  String getType(User user) {
    if (this.source!.id == user.id) return "LIKE";
    return "REQUEST";
  }
}
