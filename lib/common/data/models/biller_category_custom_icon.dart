
enum BillersCategoryCustomIcon {
  UTILITIES,
  CABLE,
  AIRTIME,
  DATA,
  INTERNET,
  FINANCIAL,
  TRAVEL,
  TRANSPORT,
  TAX,
  RELIGION,
  EXAM
}

extension BillersCategoryCustomIconExtension on BillersCategoryCustomIcon {
  String get name => describeEnum(this);

  String describeEnum(Object enumEntry) {
    final String description = enumEntry.toString();
    final int indexOfDot = description.indexOf('.');
    assert(indexOfDot != -1 && indexOfDot < description.length - 1);
    return description.substring(indexOfDot + 1);
  }

  String get displayTitle {
    switch (this) {
      case BillersCategoryCustomIcon.UTILITIES:
        return "Utilities";
      case BillersCategoryCustomIcon.CABLE:
        return "Cable";
      case BillersCategoryCustomIcon.AIRTIME:
        return "Airtime";
      case BillersCategoryCustomIcon.DATA:
        return "Data";
      case BillersCategoryCustomIcon.INTERNET:
        return "Internet";
      case BillersCategoryCustomIcon.TRAVEL:
        return "Travel";
      case BillersCategoryCustomIcon.TRANSPORT:
        return "Transport";
      case BillersCategoryCustomIcon.TAX:
        return "Tax";
      case BillersCategoryCustomIcon.RELIGION:
        return "Religious";
      case BillersCategoryCustomIcon.FINANCIAL:
        return "Financial";
      case BillersCategoryCustomIcon.EXAM:
        return "Exam";
      default:
        return "No Biller Category selected";
    }
  }

  // String get displayIcon {
  //   switch (this) {
  //     case BillersCategoryCustomIcon.UTILITIES:
  //       return cyberpay_images.BillCategoryUtilities;
  //     case BillersCategoryCustomIcon.CABLE:
  //       return cyberpay_images.BillCategoryCable;
  //     case BillersCategoryCustomIcon.AIRTIME:
  //       return cyberpay_images.BillCategoryAirtime;
  //
  //     case BillersCategoryCustomIcon.DATA:
  //       return cyberpay_images.BillCategoryData;
  //
  //     case BillersCategoryCustomIcon.INTERNET:
  //       return cyberpay_images.BillCategoryInternet;
  //
  //     case BillersCategoryCustomIcon.TRAVEL:
  //       return cyberpay_images.BillCategoryTravel;
  //
  //     case BillersCategoryCustomIcon.TRANSPORT:
  //       return cyberpay_images.BillCategoryTransport;
  //
  //     case BillersCategoryCustomIcon.TAX:
  //       return cyberpay_images.BillCategoryTax;
  //     case BillersCategoryCustomIcon.RELIGION:
  //       return cyberpay_images.BillCategoryReligion;
  //     case BillersCategoryCustomIcon.EXAM:
  //       return cyberpay_images.BillCategoryExam;
  //     case BillersCategoryCustomIcon.FINANCIAL:
  //       return cyberpay_images.BillCategoryFinancials;
  //     default:
  //       return "No Biller Category selected";
  //   }
  // }
}
