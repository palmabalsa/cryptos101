// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:convert';

import 'package:cryptos101/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  TextEditingController valueController = TextEditingController();
  late String todaysValue;
  String chosenCrypto = 'BTC';
  String chosenFiat = 'NZD';
  String apiResponse = '';

  void rateMaths(CoinData coinRate) {
    double userHolding = double.parse(valueController.text);
    double todaysRate = coinRate.rate;
    setState(() {
      apiResponse = '\$ ${(userHolding * todaysRate).toStringAsFixed(2)} ';
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
            title: Row(
          children: [
            Icon(
              Icons.donut_small_sharp,
            ),
            Spacer(flex: 1),
            Text('LIME', style: TextStyle(fontWeight: FontWeight.w900)),
            Spacer(flex: 9),
          ],
        )),
        body: Center(
            child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          Container(
              height: 70,
              color: Colors.lime.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Zocial.bitcoin,
                    color: Colors.yellow.shade700,
                    size: 40,
                  ),
                  Icon(
                    Zocial.bitcoin,
                    color: Colors.yellow.shade700,
                    size: 40,
                  ),
                  Icon(
                    Zocial.bitcoin,
                    color: Colors.yellow.shade700,
                    size: 40,
                  ),
                ],
              )),
          Container(
            color: Colors.lime.shade100,
            height: 140,
            child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Spacer(),
              Column(children: [
                SizedBox(height: 42),
                SizedBox(
                    height: 90,
                    width: 80,
                    child: TextFormField(
                      controller: valueController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        // fillColor: Colors.white,
                        hintText: '....',
                        helperText: 'Amount?',
                        helperStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        isDense: true,
                      ),
                    )),
              ]),
              Spacer(),
              SizedBox(
                  height: 60,
                  width: 90,
                  child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.lime.shade100,
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            "BTC",
                            style: theme.textTheme.bodyText2,
                          ),
                          value: "BTC",
                        ),
                        DropdownMenuItem(
                            child: Text(
                              "ETH",
                              style: theme.textTheme.bodyText2,
                            ),
                            value: "ETH"),
                        DropdownMenuItem(
                            child: Text(
                              "SOL",
                              style: theme.textTheme.bodyText2,
                            ),
                            value: "SOL"),
                        DropdownMenuItem(
                            child:
                                Text("DOT", style: theme.textTheme.bodyText2),
                            value: "DOT"),
                        DropdownMenuItem(
                            child:
                                Text("LUN", style: theme.textTheme.bodyText2),
                            value: "LUN"),
                        DropdownMenuItem(
                            child:
                                Text("POLY", style: theme.textTheme.bodyText2),
                            value: "POLY"),
                        DropdownMenuItem(
                            child:
                                Text("FTM", style: theme.textTheme.bodyText2),
                            value: "FTM"),
                      ],
                      value: chosenCrypto,
                      onChanged: (value) {
                        chosenCrypto = value!;
                        print(chosenCrypto);
                      })),
              Icon(Icons.arrow_right_alt_sharp,
                  color: Colors.black, size: 40.0),
              SizedBox(
                  height: 60,
                  width: 85,
                  child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.lime.shade100,
                      items: [
                        DropdownMenuItem(
                            child:
                                Text("NZD", style: theme.textTheme.bodyText2),
                            value: "NZD"),
                        DropdownMenuItem(
                            child:
                                Text("AUD", style: theme.textTheme.bodyText2),
                            value: "AUD"),
                        DropdownMenuItem(
                            child:
                                Text("USD", style: theme.textTheme.bodyText2),
                            value: "USD"),
                        DropdownMenuItem(
                            child:
                                Text("JPY", style: theme.textTheme.bodyText2),
                            value: "JPY"),
                        DropdownMenuItem(
                            child:
                                Text("EUR", style: theme.textTheme.bodyText2),
                            value: "EUR"),
                      ],
                      value: chosenFiat,
                      onChanged: (value) {
                        chosenFiat = value!;
                        print(chosenFiat);
                      })),
              Spacer(),
              SizedBox(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(2),
                      ),
                      onPressed: () {
                        Future<CoinData> future =
                            getCoinRates(chosenCrypto, chosenFiat);
                        future.then((value) => rateMaths(value));
                      },
                      child: Text(
                        'Convert',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ))),
              Spacer(),
            ]),
          ),
          Container(
            color: Colors.lime,
            height: 12,
          ),
          Container(
              height: 530,
              color: Colors.lime.shade200,
              child: Column(children: [
                SizedBox(
                  height: 90,
                ),
                Text(
                  apiResponse,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 30),
                ),
              ]))
        ])));
  }
}
