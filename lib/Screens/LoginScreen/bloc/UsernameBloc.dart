import 'dart:async';

import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/LocalStorage/TokenGetter.dart';
import 'package:mobility_sqr/ModelClasses/ForgetPassModel.dart';

import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/ModelClasses/UserToken.dart';

import 'package:mobility_sqr/Validator/AppFieldValidator.dart';

// if you want to make use of PublishSubject, ReplaySubject or BehaviourSubject.

class UsernameBloc {
  bool isEmailValid, isPasswordValid;
  String email, password;
  String confirmMail;
  Repository _repository = Repository();
  final appsharedprefs=TokenGetter();

  var _userFetcher = StreamController<bool>();

  var _EmailController =
      StreamController<String>(); // created a StreamController
  var _PassController =
      StreamController<String>(); // created a StreamController

  var _EmailDataController = StreamController<String>();

  var _ConfirmEmailController = StreamController<String>();

  var _isEmailValidController = StreamController<bool>();
  var _isPassValidController = StreamController<UserToken>();



  Stream get getIsValidEmail => _isEmailValidController.stream;

  Stream get getIsValidPass => _isPassValidController.stream;

  Stream get getPass => _PassController.stream;

  Stream get isUser => _userFetcher.stream;

  Stream get EmailData => _EmailDataController.stream;

  Stream get ConfirmEmail => _ConfirmEmailController.stream;

  Stream get getEmail =>
      _EmailController.stream; // created a getter for our Stream
  // the rxdart stream controllers returns an Observable instead of a Stream

  flush() {
    _EmailController.close();
    _EmailController = StreamController<String>();
    _PassController.close();
    _PassController = StreamController<String>();
    _EmailDataController.close();
    _EmailDataController = StreamController<String>();
    _isPassValidController.close();
    _isPassValidController = StreamController<UserToken>();
    _isEmailValidController.close();
    _isEmailValidController = StreamController<bool>();
    _userFetcher.close();
    _userFetcher = StreamController<bool>();
  }
  newPasswordStream(){
    _isPassValidController.close();
    _isPassValidController = StreamController<UserToken>();
  }

  void backbtn() {
    _isEmailValidController.sink.add(false);
  }

  void SetConfirmMail(String data) {
    confirmMail=data;
    _ConfirmEmailController.sink.add(data);
  }

  void updateEmail(String data) {
    _EmailController.sink.add(data); // add whatever data we want into the Sink

    _EmailDataController.sink.add(data);
    email = data;
    if (Validator.isEmailValid(data)) {
      _isEmailValidController.sink.add(true);
    } else {
      _isEmailValidController.sink.add(false);
    }
  }


  Future<UserToken> passwordValidate() async {
    UserToken isUser = await _repository.fetch_user_token(email, password);

    _isPassValidController.sink.add(isUser);

    return isUser;


  }

  Future<UserInfo> setUserInfo(String token)  async {
    UserInfo userInfo =  await  _repository.fetch_user_info(email,token);
    return userInfo;
  }

  fetchUserCheck(int where) async {
    if (where == 0) {
      bool isUser = await _repository.fetch_user_status(email);
      return isUser;
    } else {
      email = "";
      return false;
    }
  }

  sendResetEmail() async {
    ForgetPassModel passModel= await _repository.send_resetEmail(confirmMail);
    return passModel.massage;
  }

  void updatePassword(String data) {
    _PassController.sink.add(data); // add whatever data we want into the Sink

    password = data;

  }

  flushConfirmController() {
    _ConfirmEmailController.close();
    _ConfirmEmailController = StreamController<String>();
  }

  void dispose() {
    _EmailController.close(); // close our StreamController to avoid memory leak
    _isEmailValidController.close();
    _isPassValidController.close();
    _PassController.close();
    _ConfirmEmailController.close();

    _userFetcher.close();
    _EmailDataController.close();
  }
}

final bloc = UsernameBloc(); // create an instance of the counter bloc
