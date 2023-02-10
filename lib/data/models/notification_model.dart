import 'package:flutter/foundation.dart';
import 'package:sembast/timestamp.dart';

class NotificationModel {
    final String to;
    final String from;
    final String message;
    final String notificationType;
    final String amount;
    final String currency;
    final String documentId;
    final Timestamp createdAt;
    final String fromName;
    final String toName;
    NotificationModel({required this.to,
        required this.from,
        required this.message,
        required this.notificationType,
        required this.createdAt,
        required this.documentId,
        this.fromName = '',
        this.toName = '',
        this.amount = '',
        this.currency = 'NGN',
        // this.createdAt = FieldValue.serverTimestamp(),
    });

    static NotificationModel? fromMap(Map<String, dynamic> map,
        String documentId) {
        if (map == null) return null;

        return NotificationModel(
            to: map['to'],
            from: map['from'],
            message: map['message'],
            notificationType: map['notificationType'],
            createdAt: map['createdAt'],
            documentId: documentId,
            fromName: map['fromName'] ?? '',
            toName: map['toName'] ?? '',
            amount: map['amount'] ?? '',
            currency: map['currency'] ?? 'NGN',

        );
    }

    Map<String, dynamic> toMap() {
        return {
            'to': to,
            'from': from,
            'message': message,
            'notificationType': notificationType,
            'createdAt': createdAt,
            'fromName': fromName ?? "",
            'toName': toName ?? "",
            'amount': amount ?? "",
            'currency': currency ?? "NGN",
        };
    }
}
