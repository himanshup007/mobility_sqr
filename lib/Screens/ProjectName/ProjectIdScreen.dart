import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/Screens/ProjectName/project_id_bloc.dart';
import 'package:mobility_sqr/Util/SearhBloc/search_bloc.dart';
import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
import 'package:sizer/sizer.dart';

class ProjectIdScreen extends StatefulWidget {
  final Repository repository = Repository();

  @override
  _ProjectIdScreen createState() => _ProjectIdScreen();
}

class _ProjectIdScreen extends State<ProjectIdScreen> {
  GlobalKey<_ProjectIdScreen> _myKey = GlobalKey();

  Map args;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        titleSpacing: 0.0,
        title: Text(
          "Search Project Id",
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
          create: (context) => ProjectIdBloc(widget.repository),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Project ID",
                    suffixIcon: Icon(
                      Icons.search,
                      color: AppConstants.APP_THEME_COLOR,
                    ),
                    labelStyle: TextStyle(color: AppConstants.APP_THEME_COLOR),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppConstants.APP_THEME_COLOR, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (text) {
                    if (text.length > 2) {
                      BlocProvider.of<ProjectIdBloc>(_myKey.currentContext)
                          .add(FetchProject(text));
                    }
                  },
                ),
              ),
              Expanded(
                flex: 9,
                child: BlocBuilder<ProjectIdBloc, ProjectIdState>(
                    key: _myKey,
                    builder: (context, state) {
                      if (state is ProjectIdLoading) {
                        return showMobilityLoader();
                      }
                      if (state is ProjectIdInitial) {}

                      if (state is ProjectIdError) {
                        return Center(
                          child: Container(
                            width: 100.0.w,
                            height: 50.0.h,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/no_data_found.png",
                                  color: AppConstants.APP_THEME_COLOR,
                                ),
                                Text("${state.message}"),
                              ],
                            ),
                          ),
                        );
                      }
                      if (state is ProjectIdLoaded) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.projectIdModel.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pop(
                                    context, state.projectIdModel.data[index]);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 8.0.h,
                                    width: 100.0.w,
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),

                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Colors.grey,
                                      //     offset: Offset(0.0, 1.0),
                                      //     blurRadius: 6.0,
                                      //   ),
                                      // ],
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 8,
                                          child: Container(
                                           // height: 100.0.h,
                                            child: Column(
                                             // crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // Container(
                                                        //     padding:
                                                        //         EdgeInsets.all(
                                                        //             5),
                                                        //     child: Text(
                                                        //       "Project Name",
                                                        //       textAlign:
                                                        //           TextAlign
                                                        //               .start,
                                                        //     ),
                                                        // ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          child: AutoSizeText(
                                                            state
                                                                    .projectIdModel
                                                                    .data[index]
                                                                    .projectName +
                                                                "," +
                                                                state
                                                                    .projectIdModel
                                                                    .data[index]
                                                                    .pid,
                                                            textAlign:
                                                                TextAlign.start,
                                                            minFontSize: 14,
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),

                                                      ],
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              // padding:
                                              //  EdgeInsets.all(15),
                                              //height: 100.0.h,
                                              child: Text(
                                                state.projectIdModel.data[index]
                                                    .pid,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(color: Colors.black12,height: 1,),

                                  SizedBox(
                                    height: 5,
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return Container(
                        height: 0,
                        width: 0,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
