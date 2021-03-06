import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/ModelClasses/CurrencyConversionModel.dart';
import 'package:mobility_sqr/ModelClasses/CurrencyResultModel.dart';
import 'package:mobility_sqr/ModelClasses/PerDiemModelClass.dart';
import 'package:sizer/sizer.dart';

import 'package:flutter/cupertino.dart';

import 'package:mobility_sqr/ModelClasses/AddReqPayLoad.dart';
import 'package:intl/intl.dart';
class ApproxTravelCost extends StatefulWidget {
  TravelReqPayLoad list;
  PerDiemModel perDiem;
  List<Currency_Data> currencyConversiondata;
  Function(String,int,String) airfare;

  ApproxTravelCost(
      TravelReqPayLoad this.list, this.perDiem, this.currencyConversiondata,{this.airfare});

  @override
  _ApproxTravelCostState createState() =>
      _ApproxTravelCostState(list, perDiem, currencyConversiondata);
}

class _ApproxTravelCostState extends State<ApproxTravelCost> {
  @override
  String dropdownValue = 'Select Currency';
  PerDiemModel perDiem;
  TravelReqPayLoad list;
  int _current = 0;
  List<Currency_Data> currencyConversiondata;
  double mytotal = 0.0;
  Country _selectedDialogCountry;
  ApiProvider _apiProvider = ApiProvider();
  final FormatCurrency = new NumberFormat("#,##0", "en_US");
  _ApproxTravelCostState(this.list, this.perDiem, this.currencyConversiondata);

  Widget build(BuildContext context) {
    List<Widget> CostList = list.travelCity.map((item) {
      int index = list.travelCity.indexOf(item);

      return FittedBox(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Reporting Currency",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: AppConstants.APP_THEME_COLOR,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 90.0.w,
                      height: 40,
                      child: FormField<Currency_Data>(
                        builder: (FormFieldState<Currency_Data> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                            child: DropdownButtonHideUnderline(
                              child: FittedBox(
                                child: DropdownButton<Currency_Data>(
                                  hint: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Currency"),
                                  ),
                                  value: list.travelCity[index].currency_data,
                                  isDense: true,
                                  onChanged: (newValue) {
                                    setState(() {
                                      list.travelCity[index].currency_data =
                                          newValue;
                                    });

                                    _apiProvider
                                        .get_currency_conversion(
                                            item.currency, newValue.currencyCode)
                                        .then((value) =>
                                            setReportingCurrencyTotal(
                                                value, index));
                                  },
                                  items: currencyConversiondata
                                      .map((Currency_Data value) {
                                    return DropdownMenuItem<Currency_Data>(
                                      value: value,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                value.currencyCode +
                                                    " (${value.currencyName})",
                                                textAlign: TextAlign.end,
                                              ),
                                              Container(
                                                height: 1,
                                                color: Colors.black12,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              ApproxTravelRowWidget("City Name",
                  "${item.destinationCity + "(" + item.currency + ")"}"),
              SizedBox(height: 30),
              ApproxTravelRowWidget("Per-diems",
                  "${double.parse(list.travelCity[index].perDiemCost).round()}"),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Airfare",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20.0),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 35,
                      child: TextFormField(
                        initialValue:
                            list.travelCity[index].myAirFare.toString() == null
                                ? "0"
                                : list.travelCity[index].myAirFare,
                        keyboardType:
                            TextInputType.numberWithOptions(signed: true),
                        textAlign: TextAlign.right,
                        textAlignVertical: TextAlignVertical.center,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (text) {
                          if (text == "") {
                            text = 0.0.toString();
                          }
                          this.setState(() {
                            list.travelCity[index].myAirFare = text.toString();

                          });

                          this.setState(() {
                            list.travelCity[index].myTotalCost = double.parse(
                                    list.travelCity[index].hotelCost) +
                                double.parse(
                                    list.travelCity[index].transportationCost) +
                                double.parse(
                                    list.travelCity[index].perDiemCost) +
                                double.parse(text);

                            widget.airfare(  list.travelCity[index].myAirFare,index,list.travelCity[index].myTotalCost.toString());
                          });
                        },
                        maxLength: 10,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18.0),
                        decoration: InputDecoration(
                            counterText: "",
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
              ApproxTravelRowWidget("Hotel",
                  "${double.parse(list.travelCity[index].hotelCost).toStringAsFixed(0)}"),
              SizedBox(height: 30),
              ApproxTravelRowWidget("Transportation",
                  "${double.parse(list.travelCity[index].transportationCost).toStringAsFixed(0)}"),
              SizedBox(height: 30),
              ApproxTravelRowWidget("Total",
                  "${list.travelCity[index].myTotalCost == 0.0 ? double.parse(list.travelCity[index].totalCost).toStringAsFixed(0) : FormatCurrency.format(list.travelCity[index].myTotalCost)}"),
              SizedBox(height: 30),
              ApproxTravelRowWidget(
                  "Total Cost(Currency)",
                  "${list.travelCity[index].myCurrencyTotal == null||list.travelCity[index].myCurrencyTotal=="0"||list.travelCity[index].myCurrencyTotal=="-" ? "-" : FormatCurrency.format(double.parse(list.travelCity[index].myCurrencyTotal).round())}"
                  ),
            ],
          ),
        ),
      );
    }).toList();
    return Container(
      height: 100.0.h,
      width: 100.0.w,
      child: Column(children: [
        CarouselSlider(
          items: CostList,
          options: CarouselOptions(
              enableInfiniteScroll: false,
              aspectRatio: 2.0,
              height: 60.0.h,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: CostList.map((url) {
            int index = CostList.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? AppConstants.APP_THEME_COLOR
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }

  setReportingCurrencyTotal(CurrencyResultModel value, index) {
    if (value.data.length > 0) {

      var total= double.parse(
          list.travelCity[index].hotelCost) +
          double.parse(
              list.travelCity[index].transportationCost) +
          double.parse(
              list.travelCity[index].perDiemCost) +
          double.parse(list.travelCity[index].myAirFare);

      this.setState(() {
        list.travelCity[index].myCurrencyTotal =
            (total *
                    double.parse(double.parse(value.data[0].conversionRate).toString()))
                .toStringAsFixed(0);
      });
    }
    else{
      this.setState(() {
        list.travelCity[index].myCurrencyTotal ="-";
      });
    }
  }
}

class ApproxTravelRowWidget extends StatelessWidget {
  ApproxTravelRowWidget(this.keyName, this.value);

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
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 6,
          child: Container(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
            ),
          ),
        ),
      ],
    );
  }
}
