import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/Screens/LoginScreen/UsernameConstants.dart';
import 'package:mobility_sqr/Screens/LoginScreen/bloc/UsernameBloc.dart';

class EditFieldCustom extends StatefulWidget {
  String Header, Hint;
  IconData icon;
  int type;

  EditFieldCustom(IconData icon_name, String header, String hint, int type) {
    this.Header = header;
    this.Hint = hint;
    this.icon = icon_name;
    this.type = type;
  }

  @override
  _EditFieldCustomState createState() => _EditFieldCustomState();
}

class _EditFieldCustomState extends State<EditFieldCustom> {
  bool _passwordVisible, hidePass = true;

  Stream streamName;

  getStreamName() {
    if (widget.type == 1) {
      streamName = bloc.getEmail;

      _passwordVisible = false;
    } else if (widget.type == 2) {
      streamName = bloc.getPass;

      _passwordVisible = true;
    } else {
      streamName = bloc.ConfirmEmail;

      _passwordVisible = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStreamName();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(30, 20, 20, 0),
          alignment: Alignment.centerLeft,
          child: Text(
            widget.Header,
            style: TextStyle(fontSize: 15, color: AppConstants.LABEL_COLOR),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: StreamBuilder<String>(
              stream: streamName,
              initialData: " ",
              builder: (context, snapshot) {
                return TextField(
                  maxLength: 16,
                  textInputAction: TextInputAction.unspecified,
                  obscureText: _passwordVisible ? hidePass : false,
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    hintText: widget.Hint,
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child: Icon(
                        widget.icon,
                        color: AppConstants.APP_THEME_COLOR,
                      ),
                    ),
                    suffixIcon: _passwordVisible
                        ? IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        hidePass
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppConstants.APP_THEME_COLOR,
                      ),
                      onPressed: () {
                        this.setState(() {
                          hidePass = !hidePass;
                        });
                        // Update the state i.e. toogle the state of passwordVisible variable
                      },
                    )
                        : null,
                  ),
                  onChanged: (text) {
                    if (widget.type == 1) {
                      bloc.updateEmail(text);
                    } else if (widget.type == 2) {
                      bloc.updatePassword(text);
                    } else {
                      bloc.SetConfirmMail(text);
                    }
                  },
                );
              }),
        ),
        Container(
          color: AppConstants.APP_THEME_COLOR,
          height: 1,
          margin: EdgeInsets.fromLTRB(30, 0, 20, 0),
        ),
      ],
    );
  }
}