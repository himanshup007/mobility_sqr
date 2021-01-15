import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:sizer/sizer.dart';
import 'package:currency_pickers/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:currency_pickers/currency_pickers.dart';


class ApproxTravelCost extends StatefulWidget {
  @override
  _ApproxTravelCostState createState() => _ApproxTravelCostState();


}


class _ApproxTravelCostState extends State<ApproxTravelCost> {
  @override
  String dropdownValue = 'Select Currency';

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Reporting Currency",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: AppConstants.APP_THEME_COLOR,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                       GestureDetector(
                        onTap: (){ _openCurrencyPickerDialog() ;
                        },
                        child: Container(

                          child: Text(
                            "Select Currency",
                            style: TextStyle(
                                 fontWeight: FontWeight.w600,
                                fontSize: 15.0),
                           ),
                        ),
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "City Name",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "New Delhi",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0),
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Per-diems",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "-",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0),
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Airfare",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 35,
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(signed: true),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      style: TextStyle( fontWeight: FontWeight.w500, fontSize: 15.0),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                           focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppConstants.APP_THEME_COLOR))),
                     ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Hotel",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "-",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0),
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Transportation",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "-",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0),
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Total",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "10000",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0),
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Total (Currency)",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "10,000",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildDialogItem(Country country) => Row(
    children: <Widget>[
      CurrencyPickerUtils.getDefaultFlagImage(country),
      SizedBox(width: 8.0),
      Text("+${country.currencyCode}"),
      SizedBox(width: 8.0),
      Flexible(child: Text(country.name))
    ],
  );

  void _openCurrencyPickerDialog() => showDialog(
    context: context,
    builder: (context) => Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.pink),
        child: CurrencyPickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: Text('Select your Currency'),

            itemBuilder: _buildDialogItem
        )),
  );

}


