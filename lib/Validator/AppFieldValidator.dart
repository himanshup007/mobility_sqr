import 'package:mobility_sqr/LoginScreen/UsernameConstants.dart';

class Validator {
  static bool isEmailValid(String email) {
    return UsernameConst.emailRegExp.hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return UsernameConst.passwordRegExp.hasMatch(password);
  }
}
