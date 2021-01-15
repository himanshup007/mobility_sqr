import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/ModelClasses/Depend.dart';
import 'package:sizer/sizer.dart';


class Dependents extends StatefulWidget {
  @override
  _DependentsState createState() => _DependentsState();
}

class _DependentsState extends State<Dependents> {
  var checkedValue = false;

  String dependents = """
{
"massage": "data found",
"status": true,
"data": [{
"id": 9,
"date_created": "2020-08-14T13:42:32.374951+05:30",
"date_modified": "2020-08-14T13:42:32.374959+05:30",
"created_by": "system",
"modified_by": "system",
"status": false,
"name": "p1",
"relationship": "PR",
"primary_flag": false,
"country_code": "+91",
"second_country_code": "",
"phone": "57567567",
"second_phone": "",
"isDependent": true,
"isEmergencyContact": true,
"gender": "M",
"email": "divyanshu@gmail.com",
"isAddSameAsEmployee": false,
"address1": "gyujh",
"address2": "",
"address3": "",
"city": "ghj",
"state": "Himachal Pradesh",
"address_type": null,
"country": "101",
"zip": "78",
"column1": null,
"column2": null,
"column3": null,
"column4": null,
"column5": null,
"column6": null,
"column7": null,
"column8": null,
"column9": null,
"column10": null,
"column11": null,
"column12": null,
"emp_code": "Emp112",
"organization": null,
"emp_passport": "",
"emp_visa": ""
}, {
"id": 46,
"date_created": "2020-08-24T21:54:02.781972+05:30",
"date_modified": "2020-08-24T21:54:02.781982+05:30",
"created_by": "system",
"modified_by": "system",
"status": false,
"name": "test2",
"relationship": "Ot",
"primary_flag": false,
"country_code": "+91",
"second_country_code": "",
"phone": "57567567",
"second_phone": "",
"isDependent": true,
"isEmergencyContact": true,
"gender": "M",
"email": "divyanshu@gmail.com",
"isAddSameAsEmployee": true,
"address1": "HOUSE NO 30, BHATTIYANA KHUSHALPUR",
"address2": "",
"address3": "",
"city": "DHAMPUR",
"state": "Ahvenanmaa",
"address_type": null,
"country": "4",
"zip": "246761",
"column1": null,
"column2": null,
"column3": null,
"column4": null,
"column5": null,
"column6": null,
"column7": null,
"column8": null,
"column9": null,
"column10": null,
"column11": null,
"column12": null,
"emp_code": "Emp112",
"organization": null,
"emp_passport": "",
"emp_visa": ""
}, {
"id": 47,
"date_created": "2020-08-24T21:55:44.282341+05:30",
"date_modified": "2020-08-24T21:55:44.282350+05:30",
"created_by": "system",
"modified_by": "system",
"status": false,
"name": "test9",
"relationship": "SP",
"primary_flag": false,
"country_code": "+91",
"second_country_code": "",
"phone": "57567567",
"second_phone": "",
"isDependent": true,
"isEmergencyContact": true,
"gender": "M",
"email": "divyanshu@gmail.com",
"isAddSameAsEmployee": true,
"address1": "HOUSE NO 30, BHATTIYANA KHUSHALPUR",
"address2": "",
"address3": "",
"city": "DHAMPUR",
"state": "Ahvenanmaa",
"address_type": null,
"country": "4",
"zip": "246761",
"column1": null,
"column2": null,
"column3": null,
"column4": null,
"column5": null,
"column6": null,
"column7": null,
"column8": null,
"column9": null,
"column10": null,
"column11": null,
"column12": null,
"emp_code": "Emp112",
"organization": null,
"emp_passport": "",
"emp_visa": ""
}, {
"id": 48,
"date_created": "2020-08-24T22:25:27.985382+05:30",
"date_modified": "2020-08-24T22:25:27.985392+05:30",
"created_by": "system",
"modified_by": "system",
"status": false,
"name": "test",
"relationship": "Ot",
"primary_flag": false,
"country_code": "+91",
"second_country_code": "",
"phone": "57567567",
"second_phone": "",
"isDependent": true,
"isEmergencyContact": true,
"gender": "M",
"email": "divyanshu@gmail.com",
"isAddSameAsEmployee": true,
"address1": "HOUSE NO 30, BHATTIYANA KHUSHALPUR",
"address2": "",
"address3": "",
"city": "DHAMPUR",
"state": "Ahvenanmaa",
"address_type": null,
"country": "4",
"zip": "246761",
"column1": null,
"column2": null,
"column3": null,
"column4": null,
"column5": null,
"column6": null,
"column7": null,
"column8": null,
"column9": null,
"column10": null,
"column11": null,
"column12": null,
"emp_code": "Emp112",
"organization": null,
"emp_passport": "",
"emp_visa": ""
}, {
"id": 49,
"date_created": "2020-08-24T22:25:28.045205+05:30",
"date_modified": "2020-08-24T22:25:28.045214+05:30",
"created_by": "system",
"modified_by": "system",
"status": false,
"name": "test",
"relationship": "Ot",
"primary_flag": false,
"country_code": "+91",
"second_country_code": "",
"phone": "57567567",
"second_phone": "",
"isDependent": true,
"isEmergencyContact": true,
"gender": "M",
"email": "divyanshu@gmail.com",
"isAddSameAsEmployee": true,
"address1": "HOUSE NO 30, BHATTIYANA KHUSHALPUR",
"address2": "",
"address3": "",
"city": "DHAMPUR",
"state": "Ahvenanmaa",
"address_type": null,
"country": "4",
"zip": "246761",
"column1": null,
"column2": null,
"column3": null,
"column4": null,
"column5": null,
"column6": null,
"column7": null,
"column8": null,
"column9": null,
"column10": null,
"column11": null,
"column12": null,
"emp_code": "Emp112",
"organization": null,
"emp_passport": "",
"emp_visa": ""
}, {
"id": 50,
"date_created": "2020-08-24T22:25:28.103641+05:30",
"date_modified": "2020-08-24T22:25:28.103650+05:30",
"created_by": "system",
"modified_by": "system",
"status": false,
"name": "test",
"relationship": "Ot",
"primary_flag": false,
"country_code": "+91",
"second_country_code": "",
"phone": "57567567",
"second_phone": "",
"isDependent": true,
"isEmergencyContact": true,
"gender": "M",
"email": "divyanshu@gmail.com",
"isAddSameAsEmployee": true,
"address1": "HOUSE NO 30, BHATTIYANA KHUSHALPUR",
"address2": "",
"address3": "",
"city": "DHAMPUR",
"state": "Ahvenanmaa",
"address_type": null,
"country": "4",
"zip": "246761",
"column1": null,
"column2": null,
"column3": null,
"column4": null,
"column5": null,
"column6": null,
"column7": null,
"column8": null,
"column9": null,
"column10": null,
"column11": null,
"column12": null,
"emp_code": "Emp112",
"organization": null,
"emp_passport": "",
"emp_visa": ""
}, {
"id": 58,
"date_created": "2020-09-04T12:21:00.127059+05:30",
"date_modified": "2020-09-04T12:21:00.127067+05:30",
"created_by": "system",
"modified_by": "system",
"status": false,
"name": "child1",
"relationship": "Ch",
"primary_flag": false,
"country_code": "+374",
"second_country_code": "",
"phone": "745756765",
"second_phone": "",
"isDependent": true,
"isEmergencyContact": true,
"gender": "M",
"email": "gf@fdf.com",
"isAddSameAsEmployee": false,
"address1": "hgf",
"address2": "",
"address3": "",
"city": "hgfh",
"state": "Heard and McDonald Islands",
"address_type": null,
"country": "96",
"zip": "654",
"column1": null,
"column2": null,
"column3": null,
"column4": null,
"column5": null,
"column6": null,
"column7": null,
"column8": null,
"column9": null,
"column10": null,
"column11": null,
"column12": null,
"emp_code": "Emp112",
"organization": null,
"emp_passport": "",
"emp_visa": ""
}]
}

    """;

  Depend fact;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String receivedJson = dependents;
    Map<String, dynamic> list = json.decode(receivedJson);

    fact = Depend.fromJson(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white38,
          elevation: 0,
          title: Text("Travelling with dependents",
              style: TextStyle(color: Colors.black, fontSize: 17.0)),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 12,
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                shrinkWrap: false,
                itemCount: fact.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            fact.data[index].isSelected = !fact.data[index].isSelected;
                          });
                        },
                        child: Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Container(

                                child: Column(
                                  children: [
                                    SizedBox(height: 18),
                                    RowWidget("Name", fact.data[index].name),
                                    SizedBox(height: 8),
                                    RowWidget("Relation",
                                        fact.data[index].relationship),
                                    SizedBox(height: 8),
                                    RowWidget(
                                        "Visa Number", fact.data[index].empCode),
                                    SizedBox(height: 8),
                                    RowWidget(
                                        "Passport Number", fact.data[index].city),
                                    SizedBox(height: 8),
                                    RowWidget("Visa Validity", "Valid"),
                                    //SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Checkbox(
                                checkColor: Colors.white,
                                activeColor: AppConstants.APP_THEME_COLOR,
                                value: fact.data[index].isSelected,
                                onChanged: (bool value) {
                                  setState(() {
                                    fact.data[index].isSelected = value;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 18),
                      Container(
                        height: 1,
                        color: Colors.black38,
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
               child: FlatButton(
                 minWidth: MediaQuery.of(context).size.width,
                child: Text(
                'DONE',
                style: TextStyle(fontSize: 17.0),
                textAlign: TextAlign.center,
                  ),

                  textColor: Colors.white,
                  color: AppConstants.APP_THEME_COLOR,
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                Navigator.pop(context);
                  },
                ),
                   ),
            ),
          ],
        ));
  }
}

class RowWidget extends StatelessWidget {
  RowWidget(this.keyName, this.value);

  final String keyName;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Container(
            child: Text(
              keyName,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 6,
          child: Container(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
