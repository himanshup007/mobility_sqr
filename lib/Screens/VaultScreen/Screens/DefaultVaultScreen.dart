import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/ModelClasses/DocumentModelClass.dart';
import 'package:mobility_sqr/Screens/VaultScreen/Screens/VaultTypeScreen.dart';
import 'package:mobility_sqr/Widgets/CutsomLoader.dart';
import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
import 'package:mobility_sqr/Widgets/NotificationWidget.dart';
import 'package:mobility_sqr/Widgets/ToastCustom.dart';
import 'package:path/path.dart' as p;
import 'package:sizer/sizer.dart';

class DefaultVaultScreen extends StatefulWidget {
  String VaultType;

  String vaultId;

  DefaultVaultScreen(@required this.VaultType, @required this.vaultId);

  @override
  _DefaultVaultScreenState createState() => _DefaultVaultScreenState();
}

class _DefaultVaultScreenState extends State<DefaultVaultScreen> {
  ApiProvider _apiProvider = ApiProvider();
  bool showloader = true;
  DocumentModelClass documents = DocumentModelClass();

  TextStyle _customStyle =
      TextStyle(fontSize: 18, color: Colors.amber, fontWeight: FontWeight.w600);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiProvider
        .get_doc_vault(widget.vaultId)
        .then((value) => this.setState(() {
              this.setState(() {
                documents = value;
                showloader = false;
              });
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        titleSpacing: 0.0,
        title: Text(
          "${this.widget.VaultType}",
          style: TextStyle(
              color: AppConstants.TEXT_BACKGROUND_COLOR,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          GetNotificationIcon(context),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              height: 100.0.h,
              width: 100.0.w,
              child: documents.data != null
                  ? ListView.builder(
                      itemBuilder: (context, index) =>
                          _renderContainer("key$index", index),
                      itemCount: documents.data.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true)
                  : SizedBox(),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppConstants.APP_THEME_COLOR,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    " Add New",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VaultTypeScreen(
                            '${widget.VaultType}', widget.vaultId)),
                  );
                },
              ),
            ),
          ),
          showMobilityLoader(showloader, Colors.white70)
        ],
      ),
    );
  }

  Widget _renderContainer(mykey, int index) {
    mykey = GlobalKey<SimpleFoldingCellState>();
    return Container(
      color: Colors.transparent,
      child: SimpleFoldingCell.create(
        key: mykey,
        frontWidget: _buildFrontWidget(mykey, documents.data, index),
        innerWidget: _buildInnerWidget(mykey, documents.data, index),
        cellSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height / 4),
        padding: EdgeInsets.all(15),
        animationDuration: Duration(milliseconds: 300),
        borderRadius: 10,
        onOpen: () => print('View'),
        onClose: () => print('cell closed'),
      ),
    );
  }

  Widget _buildFrontWidget(mykey, List<Data> documents, int index) {
    return GestureDetector(
      onTap: () {
        mykey?.currentState?.toggleFold();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: new LinearGradient(
              colors: [
                const Color(0xFF575fd0),
                const Color(0xFF8489f4),
                const Color(0xFF5052ca),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0, 2.0],
              tileMode: TileMode.clamp),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100.0.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("Document Name", style: _customStyle),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        documents[index].docName,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text("Document Description", style: _customStyle),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        documents[index].docDescription,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        maxLines: 3,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "View Document",
                        style: TextStyle(color: Colors.amber, fontSize: 16),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

// onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
  Widget _buildInnerWidget(mykey, List<Data> docdata, int index) {
    return Container(
      color: Color(0xFFecf2f9),
      padding: EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Container(
            width: 100.0.w,
            child: Align(
              alignment: Alignment.center,
              child: p.extension(docdata[index].documentUrl) != '.pdf'
                  ? FadeInImage(
                      image: NetworkImage(
                          '${AppConstants.BASE_URL}${docdata[index].documentUrl}'),
                      placeholder:
                          AssetImage("assets/images/loading_image.gif"))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Icon(
                            Icons.picture_as_pdf,
                            color: AppConstants.APP_THEME_COLOR,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                showGeneralDialog(
                                  context: context,
                                  barrierColor: Colors.black12.withOpacity(0.6),
                                  // background color
                                  barrierDismissible: false,
                                  // should dialog be dismissed when tapped outside
                                  barrierLabel: "Dialog",
                                  // label for barrier
                                  transitionDuration:
                                      Duration(milliseconds: 400),
                                  // how long it takes to popup dialog after button click
                                  pageBuilder: (_, __, ___) {
                                    // your widget implementation
                                    return SizedBox.expand(
                                        // makes widget fullscreen
                                        child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 80.0.h,
                                              width: 100.0.w,
                                              child: PDF().fromUrl(
                                                '${AppConstants.BASE_URL}${docdata[index].documentUrl}',
                                                placeholder:
                                                    (double progress) =>
                                                        Material(
                                                  child: Stack(
                                                    children: [
                                                      Center(
                                                        child: showMobilityLoader(
                                                            true,
                                                            Colors.transparent),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 100),
                                                          child: Text(
                                                            '$progress %',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                errorWidget: (dynamic error) =>
                                                    Center(
                                                        child: Text(
                                                            error.toString())),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 10,
                                            right: 5,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.red,
                                                  shape: CircleBorder(),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('X')),
                                          ),
                                        ],
                                      ),
                                    ));
                                  },
                                );
                              },
                              child: Text(
                                "View PDF",
                                style: TextStyle(color: Colors.black),
                              ))
                        ]),
            ),
          ),
          Positioned(
            top: 0,
            right: 5,
            child: GestureDetector(
              onTap: () {
                mykey?.currentState?.toggleFold();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.deepPurpleAccent),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Close",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
