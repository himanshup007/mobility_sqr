import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:sizer/sizer.dart';
class SearchPlace extends StatefulWidget {
   @override
   _SearchPlaceState createState() => _SearchPlaceState();
 }

 class _SearchPlaceState extends State<SearchPlace> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
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
         height: 100.0.h,
         width: 100.0.w,
         child: Column(

           children: [
             Container(
               margin: EdgeInsets.symmetric(horizontal: 10),

               child: TextFormField(
                 decoration: InputDecoration(
                   labelText: "Place Name",
                   suffixIcon: Icon(Icons.search,color: AppConstants.APP_THEME_COLOR,),
          labelStyle: TextStyle(color: AppConstants.APP_THEME_COLOR),
                   border:OutlineInputBorder(
                     borderSide: const BorderSide(color: Colors.white, width: 2.0),
                     borderRadius: BorderRadius.circular(5.0),
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: const BorderSide(color: AppConstants.APP_THEME_COLOR, width: 2.0),
                     borderRadius: BorderRadius.circular(5.0),
                   ),
                 ),
               )

             ),
           ],
         ),
       ),
     );
   }
 }
