import 'dart:convert';

class Wallet {
  final double amount;
  Wallet({
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
    };
  }

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      amount: map['amount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Wallet.fromJson(String source) => Wallet.fromMap(json.decode(source));
}
