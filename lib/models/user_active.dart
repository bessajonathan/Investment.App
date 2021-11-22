import 'dart:convert';

import 'package:investment/models/active.dart';

class UserActive {
  final Active active;
  final int quantity;
  UserActive({
    required this.active,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'active': active.toMap(),
      'quantity': quantity,
    };
  }

  factory UserActive.fromMap(Map<String, dynamic> map) {
    return UserActive(
      active: Active.fromMap(map['active']),
      quantity: map['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserActive.fromJson(String source) =>
      UserActive.fromMap(json.decode(source));
}
