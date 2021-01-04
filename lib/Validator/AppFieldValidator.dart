import 'package:mobility_sqr/Screens/LoginScreen/UsernameConstants.dart';

class Validator {
  static bool isEmailValid(String email) {
   // return UsernameConst.emailRegExp.hasMatch(email);
    return true;
  }

  static bool isPasswordValid(String password) {
    return UsernameConst.passwordRegExp.hasMatch(password);
  }
}
