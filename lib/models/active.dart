import 'dart:convert';

class Active {
  final double amount;
  final String activeType;
  Active({
    required this.amount,
    required this.activeType,
  });

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'activeType': activeType,
    };
  }

  factory Active.fromMap(Map<String, dynamic> map) {
    return Active(
      amount: map['amount'],
      activeType: map['activeType'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Active.fromJson(String source) => Active.fromMap(json.decode(source));
}
