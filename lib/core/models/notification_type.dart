enum NotificationType {
    Withdrawal,
    BillPayment,
    RequestMoney,
    FundWallet,
    SendMoney,
    ReceiveMoney,
    Anonymous,
}

extension NotificationTypeExtension on NotificationType {
    String get name => describeEnum(this);

    String describeEnum(Object enumEntry) {
        final String description = enumEntry.toString();
        final int indexOfDot = description.indexOf('.');
        assert(indexOfDot != -1 && indexOfDot < description.length - 1);
        return description.substring(indexOfDot + 1);
    }

    String get displayTitle {
        switch (this) {
            case NotificationType.Withdrawal:
                return "Withdrawal";
            case NotificationType.BillPayment:
                return "Bill Payment";
            case NotificationType.RequestMoney:
                return "Request Money";
            case NotificationType.FundWallet:
                return "Fund Wallet";
            case NotificationType.SendMoney:
                return "Send Money";
            case NotificationType.ReceiveMoney:
                return "Receive Money";
            case NotificationType.Anonymous:
                return "Anonymous";
            default:
                return "";
        }
    }
}
