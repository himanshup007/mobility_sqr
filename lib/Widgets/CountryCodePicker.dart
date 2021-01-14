import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

void openCountryPickerDialog(BuildContext context,
        {Function(Country) callback, List<String> dialCode}) =>
    showDialog(
      context: context,
      builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: CountryPickerDialog(
              titlePadding: EdgeInsets.all(8.0),
              searchCursorColor: Colors.pinkAccent,
              searchInputDecoration: InputDecoration(hintText: 'Search......'),
              isSearchable: true,
              itemFilter: (c) => dialCode.contains(c.isoCode),
              title: Text('Select your Phone Code'),
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
          width: 10,
        ),
        Expanded(
            flex: 2,
            child: Container(
                child: Text(
              "+${country.phoneCode}",
              textAlign: TextAlign.start,
            ))),
        Expanded(
            flex: 5,
            child: Text(
              country.name,
              maxLines: 1,
            ))
      ],
    );
