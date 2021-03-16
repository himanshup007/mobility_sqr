
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:mobility_sqr/ModelClasses/CountryListModel.dart';

getDepartureTime(String date) {
  final depatureDate = DateTime.parse(date).toLocal();
  final String datestring = DateFormat("dd MMM yy").format(depatureDate);
  return datestring;
}
getPassportimeformat(String date) {
  final depatureDate = DateTime.parse(date).toLocal();
  final String datestring = DateFormat("dd/MMM/yy").format(depatureDate);
  return datestring;
}

getNotifcationDateUpper(String date){
  final depatureDate = DateTime.parse(date).toLocal();
  final String datestring = DateFormat("MMM dd").format(depatureDate);
  return datestring;
}
getNotifcationDateLower(String date){
  final depatureDate = DateTime.parse(date).toLocal();
  final String datestring = DateFormat("yyyy").format(depatureDate);
  return datestring;
}
getDepartureEventFormat(String date) {
  if(date==null){
    return  "";
  }else{
    final depatureDate = DateTime.parse(date).toLocal();
    final String datestring = DateFormat("dd MMMM yyyy").format(depatureDate);
    return datestring;
  }


}

getDepatureDate(String date) {
  final depatureDate = DateTime.parse(date);
  final String daystring = DateFormat('EEEE').format(depatureDate);
  return daystring;
}

Future<Null> selectDate(BuildContext context, DateTime first_date,
    DateTime end_date, DateTime initalDate,
    {Function(String) datevalue}) async {
  final DateTime picked = await showDatePicker(
      context: context,
      initialDate: initalDate,
      helpText: "",
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppConstants.APP_THEME_COLOR,
            accentColor: AppConstants.APP_THEME_COLOR,
            colorScheme: ColorScheme.light(
              primary: AppConstants.APP_THEME_COLOR,
            ),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
      firstDate: first_date,
      lastDate: end_date);
  if (picked != null) {
    datevalue(picked.toLocal().toIso8601String());
  }
}


 openCustomCountryPickerDialog(BuildContext context,
    {Function(Country) callback, List<String> list}) =>
    showDialog(
      context: context,
      builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: AppConstants.APP_THEME_COLOR),
          child: CountryPickerDialog(

              titlePadding: EdgeInsets.all(8.0),
              searchCursorColor:AppConstants.APP_THEME_COLOR,
              searchInputDecoration: InputDecoration(hintText: 'Search......'),
              isSearchable: true,
              itemFilter: (c) => list.contains(c.isoCode),
              title: Text('Select your Country',style: TextStyle(color: AppConstants.APP_THEME_COLOR),),
              onValuePicked: ((Country country) => callback(country)),
              itemBuilder: _buildDialogItem)),
    );

Widget _buildDialogItem(Country country) => Row(
  children: <Widget>[
    Expanded(
      flex: 1,
      child: CountryPickerUtils.getDefaultFlagImage(country),
    ),
    SizedBox(
      width: 20,
    ),
    Expanded(
        flex: 10,
        child: Container(
            child: Text(
              "${country.name}",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.start,
            ))),
    // Expanded(
    //     flex: 5,
    //     child: Text(
    //       country.name,
    //       maxLines: 1,
    //     ))
  ],
);
