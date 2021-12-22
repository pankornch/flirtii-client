class User {
  late String? id;
  late String? email;
  late String? firstName;
  late String? lastName;
  late String? gender;
  late String? nickname;
  late String? about;
  late String? avatar;
  late String? bio;
  late DateTime? birthDate;
  late List<String>? images;
  late List<String>? preferred;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.nickname,
    this.about,
    this.avatar,
    this.bio,
    this.birthDate,
    this.images,
    this.preferred,
  });

  User.fromJson(Map<String, dynamic> json) {
    this.id = json["_id"];
    this.email = json["email"];
    this.firstName = json["firstName"];
    this.lastName = json["lastName"];
    this.gender = json["gender"];
    this.nickname = json["nickname"];
    this.about = json["about"];
    this.avatar = json["avatar"];
    this.bio = json["bio"];
    // this.birthDate = DateTime.tryParse(json["birthDate"]);
    // this.images = json["images"];
    // this.preferred = json["preferred"];
  }
}
