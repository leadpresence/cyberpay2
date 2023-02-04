enum UserRole {
  Customer,
  Business,
  SalesRepresentative,
}

extension UserRoleExtension on UserRole {
  String get name => describeEnum(this);

  String describeEnum(Object enumEntry) {
    final String description = enumEntry.toString();
    final int indexOfDot = description.indexOf('.');
    assert(indexOfDot != -1 && indexOfDot < description.length - 1);
    return description.substring(indexOfDot + 1);
  }

  String get displayTitle {
    switch (this) {
      case UserRole.Customer:
        return "Customer";
      case UserRole.Business:
        return "Business";
      case UserRole.SalesRepresentative:
        return "Sales Representative";
      default:
        return "Customer";
    }
  }
}
