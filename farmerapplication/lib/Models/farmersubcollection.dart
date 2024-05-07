import 'package:cloud_firestore/cloud_firestore.dart';

class DailyCollection {
  Timestamp collectedDate;
  String type;
  String vege;
  int amount;
  int expectedPrice;

  DailyCollection({
    required this.collectedDate,
    required this.type,
    required this.vege,
    required this.amount,
    required this.expectedPrice,
  });

  factory DailyCollection.fromJson(Map<String, dynamic> json) {
    return DailyCollection(
      collectedDate: json['collectedDate'] as Timestamp,
      type: json['type'] as String? ?? '',
      vege: json['vege'] as String? ?? '',
      amount: json['amount'] as int? ?? 0,
      expectedPrice: json['expectedPrice'] as int? ?? 0,
    );
  }

  DailyCollection copyWith({
    Timestamp? collectedDate,
    String? type,
    String? vege,
    int? amount,
    int? expectedPrice,
  }) {
    return DailyCollection(
      collectedDate: collectedDate ?? this.collectedDate,
      type: type ?? this.type,
      vege: vege ?? this.vege,
      amount: amount ?? this.amount,
      expectedPrice: expectedPrice ?? this.expectedPrice,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'collectedDate': collectedDate,
      'type': type,
      'vege': vege,
      'amount': amount,
      'expectedPrice': expectedPrice,
    };
  }
}
