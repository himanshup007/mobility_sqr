import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/ModelClasses/CountryListModel.dart';
import 'package:sizer/sizer.dart';

class CityList extends StatefulWidget {
  Function(String) onchange;
  List<CountryModel> cityList;
  VoidCallback onclose;

  CityList(this.cityList, {this.onchange, this.onclose});

  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  TextEditingController controller=TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0.h,
      width: 100.0.w,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Search City",style: TextStyle(color: AppConstants.APP_THEME_COLOR,fontSize: 25,fontWeight: FontWeight.bold),),
          ),

          Container(

            decoration: BoxDecoration(
                border: Border.all(color: AppConstants.APP_THEME_COLOR)
            ),
            padding: EdgeInsets.zero,
            child:  ListTile(
              leading:  Icon(Icons.search,color: AppConstants.APP_THEME_COLOR,size: 30,),
              title:  TextField(
                controller: controller,
                style: TextStyle(fontSize: 18),
                decoration:  InputDecoration(
                    hintText: 'Search....', border: InputBorder.none,
                contentPadding: EdgeInsets.zero),
                onChanged: (val) {},
              ),
              trailing:  IconButton(
                icon:  Icon(Icons.cancel),
                onPressed: () {
                  controller.clear();
                  onSearchTextChanged('');
                },
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.cityList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text('${widget.cityList[index].name}',style: TextStyle(fontSize: 18),),
                    ),
                    Divider(thickness: 1,)
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void onSearchTextChanged(String s) {}
}
