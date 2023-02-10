enum BillersCustomIcon {
  MTN,
  NINE_MOBILE,
  DSTV,
  STARTIMES,
  GOTV,
  AIRTEL,
  IKEDC,
  EKEDC,
  GLO,
}

extension BillersCustomIconExtension on BillersCustomIcon {
  String get name => describeEnum(this);

  String describeEnum(Object enumEntry) {
    final String description = enumEntry.toString();
    final int indexOfDot = description.indexOf('.');
    assert(indexOfDot != -1 && indexOfDot < description.length - 1);
    return description.substring(indexOfDot + 1);
  }

  String get displayTitle {
    switch (this) {
      case BillersCustomIcon.MTN:
        return "MTN";
      case BillersCustomIcon.NINE_MOBILE:
        return "9Mobile";

      case BillersCustomIcon.DSTV:
        return "DSTV";

      case BillersCustomIcon.STARTIMES:
        return "Startimes";

      case BillersCustomIcon.GOTV:
        return "Gotv";

      case BillersCustomIcon.AIRTEL:
        return "Airtel";

      case BillersCustomIcon.IKEDC:
        return "IkEDC";

      case BillersCustomIcon.EKEDC:
        return "EKEDC";
      case BillersCustomIcon.GLO:
        return "GLO";
      default:
        return "No Biller selected";
    }
  }

  String get displayIcon {
    switch (this) {
      case BillersCustomIcon.MTN:
        return "assets/images/logo_mtn.png";
      case BillersCustomIcon.NINE_MOBILE:
        return "assets/images/logo_9mobile.png";
      case BillersCustomIcon.DSTV:
        return "assets/images/logo_dstv.png";
      case BillersCustomIcon.STARTIMES:
        return "assets/images/logo_startimes.png";
      case BillersCustomIcon.GOTV:
        return "assets/images/logo_gotv.png";
      case BillersCustomIcon.AIRTEL:
        return "assets/images/logo_airtel.png";
      case BillersCustomIcon.IKEDC:
        return "assets/images/logo_ikedc.png";
      case BillersCustomIcon.EKEDC:
        return "assets/images/logo_ekedc.png";
      case BillersCustomIcon.GLO:
        return "assets/images/logo_glo.png";
      default:
        return "";
    }
  }
}
