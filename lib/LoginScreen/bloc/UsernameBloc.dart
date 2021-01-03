import 'dart:async';

import 'package:mobility_sqr/LoginScreen/UsernameConstants.dart';
import 'package:mobility_sqr/Validator/AppFieldValidator.dart';

// import 'package:rxdart/rxdart.dart'; if you want to make use of PublishSubject, ReplaySubject or BehaviourSubject.

class UsernameBloc {
  bool isEmailValid, isPasswordValid;

  var _EmailController = StreamController<String>(); // created a StreamController
  var _PassController = StreamController<String>(); // created a StreamController

  var _EmailDataController= StreamController<String>();

  var _ConfirmEmailController= StreamController<String>();


  var _isEmailValidController = StreamController<bool>();
  var _isPassValidController = StreamController<bool>();

  Stream get getIsValidEmail => _isEmailValidController.stream;
  Stream get getIsValidPass => _isPassValidController.stream;
  Stream get getPass=>_PassController.stream;
  Stream get EmailData=>_EmailDataController.stream;
  Stream get ConfirmEmail=>_ConfirmEmailController.stream;

  Stream get getEmail => _EmailController.stream; // created a getter for our Stream
  // the rxdart stream controllers returns an Observable instead of a Stream

  flush() {
    _EmailController.close();
    _EmailController = StreamController<String>();
    _PassController.close();
    _PassController=StreamController<String>();

    _EmailDataController.close();
    _EmailDataController=StreamController<String>();
    _isPassValidController.close();
    _isPassValidController =StreamController<bool>();
    _isEmailValidController.close();
    _isEmailValidController =StreamController<bool>();
  }

void backbtn(){

  _isEmailValidController.sink.add(false);

}
void SetConfirmMail(String data){

    _ConfirmEmailController.sink.add(data);


}

  void updateEmail(String data) {
    _EmailController.sink.add(data); // add whatever data we want into the Sink

    _EmailDataController.sink.add(data);
    if (Validator.isEmailValid(data)) {

      _isEmailValidController.sink.add(true);


    } else {

      _isEmailValidController.sink.add(false);

    }
  }
  void updatePassword(String data) {
    _PassController.sink.add(data); // add whatever data we want into the Sink

    if (Validator.isPasswordValid(data)) {

      _isPassValidController.sink.add(true);


    } else {

      _isPassValidController.sink.add(false);

    }
  }
  flushConfirmController(){
    _ConfirmEmailController.close();
    _ConfirmEmailController=StreamController<String>();
  }



  void dispose() {
    _EmailController.close(); // close our StreamController to avoid memory leak
    _isEmailValidController.close();
    _isPassValidController.close();
    _PassController.close();
    _ConfirmEmailController.close();
    _isPassValidController.close();
  }
}



final bloc = UsernameBloc(); // create an instance of the counter bloc
