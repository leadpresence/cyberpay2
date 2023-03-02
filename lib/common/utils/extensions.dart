extension ValidatorX on String {
  /// validateEmail
  bool validateEmail() => RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',)
      .hasMatch(this);

  /// validatePassword
  bool validatePassword() =>
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,10}$')
          .hasMatch(this);

  bool get isValidEmail {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName{
    final nameRegExp = RegExp(r'[a-zA-Z]');
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword{
    final passwordRegExp =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull{
    return this!=null;
  }

  bool get isValidPhone{
final phoneRegExp = RegExp(r'^\+?0[0-9]{10}$');
    return phoneRegExp.hasMatch(this);
  }


}

/// hideNumberPart
String hideNumberPart(String number) {
  const marsk = '**** ***';
  String newNumber = '';
  if (number.length == 11) {
    newNumber = number.replaceRange(7, 11, marsk);
  } else if(number.length>13){
    newNumber = number.replaceRange(7, 11, marsk);
  }
  else {
    newNumber = number;
  }

  return newNumber;
}


///  isEmptyOrNull
bool isEmptyOrNull(String? value) {
  if (value == null || value.isEmpty ) {
    return true;
  } else {
    return false;
  }
}