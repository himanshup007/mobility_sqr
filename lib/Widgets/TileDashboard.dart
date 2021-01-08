
import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:sizer/sizer.dart';

class TileDashboard extends StatelessWidget{

final VoidCallback onTap;
String images;
String textLine1;
String textLine2;

 TileDashboard(String images,String textLine1,String textLine2,{this.onTap}){
   this.images=images;
   this.textLine1=textLine1;
   this.textLine2=textLine2;
 }

  @override
  Widget build(BuildContext context) {

   return GestureDetector(
     onTap: (){
       onTap();
     },
     child: Expanded(
       child: Stack(
         children: [
           Container(
             height: 48.0.w,
             child: Image.asset(
               images,
               fit: BoxFit.contain,
             ),
           ),
           Container(
             margin: EdgeInsets.symmetric(horizontal: 10),
             child: Align(
               alignment: Alignment.centerLeft,
               child: Text(textLine1,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppConstants.TEXT_BACKGROUND_COLOR),),
             ),
           ),
           Container(
             margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
             child: Align(
               alignment: Alignment.centerLeft,
               child: Text(textLine2,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppConstants.TEXT_BACKGROUND_COLOR),),
             ),
           )
         ],
       ),
     ),
   );
  }
}