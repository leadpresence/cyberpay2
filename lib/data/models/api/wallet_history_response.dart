// To parse this JSON data, do
//
//     final walletHistoryResponse = walletHistoryResponseFromMap(jsonString);

import 'dart:convert';

WalletHistoryResponse walletHistoryResponseFromMap(String str) => WalletHistoryResponse.fromMap(json.decode(str));

String walletHistoryResponseToMap(WalletHistoryResponse data) => json.encode(data.toMap());

class WalletHistoryResponse {
    WalletHistoryResponse({
        required this.succeeded,
        required this.data,
    });

    bool succeeded;
    WalletData data;

    factory WalletHistoryResponse.fromMap(Map<String, dynamic> json) => WalletHistoryResponse(
        succeeded: json["succeeded"],
        data: WalletData.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "succeeded": succeeded,
        "data": data.toMap(),
    };
}

class WalletData {
    WalletData({
        required this.pageSize,
        required this.pageNumber,
        required this.totalSize,
        required this.items,
    });

    int pageSize;
    int pageNumber;
    int totalSize;
    List<WalletHistoryItem> items;

    factory WalletData.fromMap(Map<String, dynamic> json) => WalletData(
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        totalSize: json["totalSize"],
        items: List<WalletHistoryItem>.from(json["items"].map((x) => WalletHistoryItem.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "totalSize": totalSize,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
    };
}

class WalletHistoryItem {
    WalletHistoryItem({
        required this.id,
       required this.walletId,
      required  this.amount,
        required this.transactionType,
       required this.createdOn,
       required this.reference,
       required this.description,
    });

    int id;
    String walletId;
    int amount;
    TransactionType transactionType;
    DateTime createdOn;
    String reference;
    String description;

    factory WalletHistoryItem.fromMap(Map<String, dynamic> json) => WalletHistoryItem(
        id: json["id"],
        walletId: json["walletId"],
        amount: json["amount"],
        transactionType:json["transactionType"]?? transactionTypeValues.map[json["transactionType"]],
        createdOn: json["createdOn"]??DateTime.tryParse(json["createdOn"]),
        reference: json["reference"],
        description: json["description"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "walletId": walletId,
        "amount": amount,
        "transactionType": transactionTypeValues.reverse[transactionType],
        "createdOn": createdOn.toIso8601String(),
        "reference": reference,
        "description": description,
    };
}




enum TransactionType { CREDIT, DEBIT }

final transactionTypeValues = EnumValues({
    "Credit": TransactionType.CREDIT,
    "Debit": TransactionType.DEBIT
});

class EnumValues<T> {
  late  Map<String, T> map;
   late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
