class UsernameConst {
  static const String EMAIL_HINT = "Enter Username";
  static const String PASS_HINT = "Enter password";
  static final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );
  static final String EMAIL_INVALID="Please enter a valid email address.";
  static final String PASS_INVALID="Please enter a valid Password .";
  static final String USER_INVALID="User not found";
}
