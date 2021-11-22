import 'dart:convert';

import 'package:investment/models/user_active.dart';
import 'package:investment/models/wallet.dart';

class AppUser {
  final String name;
  final Wallet wallet;
  final List<UserActive> actives;
  final double summarizedEquity;
  AppUser({
    required this.name,
    required this.wallet,
    required this.actives,
    required this.summarizedEquity,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'wallet': wallet.toMap(),
      'actives': actives?.map((x) => x.toMap())?.toList(),
      'summarizedEquity': summarizedEquity,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      name: map['name'],
      wallet: Wallet.fromMap(map['wallet']),
      actives: List<UserActive>.from(
          map['actives']?.map((x) => UserActive.fromMap(x))),
      summarizedEquity: map['summarizedEquity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));
}
