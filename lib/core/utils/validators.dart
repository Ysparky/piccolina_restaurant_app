bool isValidEmail(String emailTest) {
  const pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final regex = RegExp(pattern);
  return regex.hasMatch(emailTest);
}

bool isValidPassword(String pwTest) {
  ///Should be contain :

  ///Minimum 1 Upper case  ///Minimum 1 lowercase  ///Minimum 1 Numeric Number  ///Minimum 1 Special Character
  ///Common Allow Character ( ! @ # $ & * ~ )
  const pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  final regex = RegExp(pattern);
  return regex.hasMatch(pwTest);
}
