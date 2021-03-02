import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/ModelClasses/CountryListModel.dart';
import 'package:sizer/sizer.dart';

class CityList extends StatefulWidget {
  Function(CountryModel) onchange;
  List<CountryModel> cityList;
  VoidCallback onclose;

  CityList(this.cityList, {this.onchange, this.onclose});

  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  TextEditingController controller = TextEditingController();
  List<CountryModel> cityResult= List<CountryModel>();


  @override
  void initState() {
    super.initState();

    this.setState(() {
      cityResult.addAll(widget.cityList);
      cityResult=cityResult;
    });
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
            child: Text(
              "Search City",
              style: TextStyle(
                color: AppConstants.APP_THEME_COLOR,
                fontSize: 25,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          Container(
            width: 100.0.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Expanded(
                //     flex: 1,
                //     child: Icon(
                //       Icons.search,
                //       color: AppConstants.APP_THEME_COLOR,
                //       size: 30,
                //     )),
                Expanded(
                  flex: 5,
                  child: TextField(
                    controller: controller,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppConstants.APP_THEME_COLOR),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: 'Search....',
                        border: InputBorder.none,
                        suffixIcon:  controller.text.trim().isEmpty?null:Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(Icons.clear,color: AppConstants.APP_THEME_COLOR,),
                            onPressed: () {
                              controller.clear();
                              cityResult.addAll(widget.cityList);
                              this.setState(() {

                                cityResult=cityResult;
                              });

                            },
                          ),
                        ),
                        contentPadding: EdgeInsets.all(10)),
                    onChanged: (val) {

                      if(val.isEmpty){
                        cityResult.addAll(widget.cityList);
                        this.setState(() {

                          cityResult=cityResult;
                        });
                      }else{
                        cityResult.clear();
                        for(int i=0;i<widget.cityList.length;i++){

                          if(widget.cityList[i].name.trim().toLowerCase().startsWith(val.trim().toLowerCase())){
                            cityResult.add(widget.cityList[i]);
                          }
                        }
                        this.setState(() {
                          cityResult= cityResult;
                        });
                      }
                    },
                  ),
                ),

              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cityResult.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap:(){
                        widget.onchange(cityResult[index]);
                        widget.onclose();
                },
                      child: ListTile(
                        title: Text(
                          '${cityResult[index].name}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }


}
