import 'dart:convert';

class CreateUser {
  String name;
  String firebaseId;
  CreateUser({
    required this.name,
    required this.firebaseId,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'firebaseId': firebaseId,
    };
  }

  factory CreateUser.fromMap(Map<String, dynamic> map) {
    return CreateUser(
      name: map['name'],
      firebaseId: map['firebaseId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateUser.fromJson(String source) =>
      CreateUser.fromMap(json.decode(source));
}
