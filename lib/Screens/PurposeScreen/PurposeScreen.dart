import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/Screens/PurposeScreen/purpose_bloc.dart';

class PurposeScreen extends StatefulWidget {
  final Repository repository = Repository();
  @override
  _PurposeScreenState createState() => _PurposeScreenState();
}

class _PurposeScreenState extends State<PurposeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:  AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        titleSpacing: 0.0,
        title: Text(
          "Search Location",
          style: TextStyle(
              color: AppConstants.TEXT_BACKGROUND_COLOR,
              fontSize: 18,
              fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppConstants.TEXT_BACKGROUND_COLOR),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: BlocProvider(
          create: (context)=>PurposeBloc(widget.repository),
          child: BlocBuilder<PurposeBloc, PurposeEvent>(

              builder: (context, state) {
                if (state is PurposeLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is PurposeInitial) {}

                if (state is PurposeError) {
                  return Center(
                    child:
                    Text('Oops Something Went Wrong!'),
                  );
                }
                if (state is PurposeLoaded) {

                }
                return Container(
                  height: 0,
                  width: 0,
                );
              }),
        ),
      ),
    );
  }
}