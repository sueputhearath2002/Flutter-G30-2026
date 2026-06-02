class PersonModel {
  final int? id;
  String name;
  String email;
  String avatar;

  PersonModel({
    this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "avatar": avatar,
  };
}
