import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/Util/SearhBloc/search_bloc.dart';
import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
import 'package:sizer/sizer.dart';

class SearchPlace extends StatefulWidget {
  final Repository repository = Repository();

  @override
  _SearchPlaceState createState() => _SearchPlaceState();
}

class _SearchPlaceState extends State<SearchPlace> {
  GlobalKey<_SearchPlaceState> _myKey = GlobalKey();

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
          create: (context) => SearchBloc(widget.repository),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Place Name",
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
                      BlocProvider.of<SearchBloc>(_myKey.currentContext)
                          .add(FetchSearchResult(text));
                    }
                  },
                ),
              ),
              Expanded(
                flex: 9,
                child: BlocBuilder<SearchBloc, SearchState>(
                    key: _myKey,
                    builder: (context, state) {
                      if (state is SearchClassLoading) {
                        return showMobilityLoader();
                      }
                      if (state is SearchInitial) {}
                      if (state is SearchClassEmpty) {
                        return Center(
                            child: Container(
                                child: Column(
                          children: [
                            Text("No data Found"),
                          ],
                        )));
                      }
                      if (state is SearchClassError) {
                        return Container(
                          width: 100.0.w,
                          height: 50.0.h,
                          child: Center(
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
                              )),
                        );
                      }
                      if (state is SearchClassLoaded) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.location.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pop(
                                    context, state.location.data[index]);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 20.0.w,
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
                                      children: [
                                        Expanded(
                                          flex: 8,
                                          child: Container(
                                            height: 100.0.h,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: Text(
                                                        state
                                                                .location
                                                                .data[index]
                                                                .airportName +
                                                            "," +
                                                            state
                                                                .location
                                                                .data[index]
                                                                .countryName,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    )),
                                                Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: Text(
                                                        state
                                                            .location
                                                            .data[index]
                                                            .airportName,
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 100.0.h,
                                            child: Center(
                                              child: Text(
                                                state.location.data[index]
                                                    .iataCode,
                                                textAlign: TextAlign.center,
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
                                  Container(
                                    color: Colors.black12,
                                    height: 1,
                                  ),
                                  SizedBox(
                                    height: 10,
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
