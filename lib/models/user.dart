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
}
