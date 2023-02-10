import 'package:flutter/cupertino.dart';

import '../../core/models/cyberpay_contact_model.dart';

class SendMoneyArgs {
  final CyberpayContactModel recipientContact;

  final String transactionReference;

  final int amountInKobo;

  SendMoneyArgs(
      {required this.recipientContact,
      required this.transactionReference,
      required this.amountInKobo});
}
