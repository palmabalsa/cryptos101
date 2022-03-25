import 'package:flutter/material.dart';
import 'package:cryptos101/services/networking.dart';

class btcView extends StatefulWidget {

  @override
  State<btcView> createState() => _btcViewState();
}

class _btcViewState extends State<btcView> {
  late Future<CoinData> btcNow;


  @override
  void initState() {
    super.initState();
    btcNow = getCoinRates('BTC');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BTC'),
      ),
      body: Center(
        child: FutureBuilder<CoinData>(
          future: btcNow,
          builder: (context, snapshot){

            if (snapshot.hasData){


              double btcRate = snapshot.data!.rate;
              String rate = btcRate.toStringAsFixed(2);

              // dates of buy ins and amount bought:

              
              //JAN 25/1/22 ==== this is a special case as this is SGD!!!!!!
              // Dont include this is in any final calculations ===
              double jan25_1_22 = 0.02;
              double then25_1_22 = 1037.91; //this is a rough currency conversion from SGD($981.07 SGD) - take this one w grain of salt
              double now25_1_22 = jan25_1_22*btcRate;
              double gain25_1_22 = now25_1_22 - then25_1_22;
              
              // FEB 18/2/22 :
              double feb18_2_22 = 0.0165;
              double then18_2_22 = 1018.44;
              double now18_2_22 = feb18_2_22*btcRate;
              double gain18_2_22 = now18_2_22 - then18_2_22;

              // FEB 19/2/22:
              double feb19_2_22 = 0.0165;
              double then19_2_22 = 1010.53;
              double now19_2_22 = feb19_2_22*btcRate;
              double gain19_2_22 = now19_2_22 - then19_2_22;

              // FEB 21/2/22 - PURCHASE 1: this is the 16pm one
              double feb21_2_22_1 = 0.017;
              double then21_2_22_1 = 1005.87;
              double now21_2_22_1 = feb21_2_22_1*btcRate;
              double gain21_2_22_1 = now21_2_22_1 - then21_2_22_1;


              // FEB 21/2/22 - PURCHASE 2: this is the other one
              double feb21_2_22_2 = 0.017;
              double then21_2_22_2 = 1009.36;
              double now21_2_22_2 = feb21_2_22_2*btcRate;
              double gain21_2_22_2 = now21_2_22_2 - then21_2_22_2;


              // FEB 23/2/22:
              double feb23_2_22 = 0.01;
              double then23_2_22 = 571.69;
              double now23_2_22 = feb23_2_22*btcRate;
              double gain23_2_22 = now23_2_22 - then23_2_22;


              return InteractiveViewer(
                constrained: false,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('DATE')),
                    DataColumn(label: Text('AMOUNT')),
                    DataColumn(label: Text('RATE')),
                    DataColumn(label: Text('THEN')),
                    DataColumn(label: Text('NOW')),
                    DataColumn(label: Text('GAIN?')),
                  ],
                  rows: [
                    DataRow(cells: [
                      // this first one is SGD!!!!!!
                      DataCell(Text('25/1/22')),
                      DataCell(Text(jan25_1_22.toString())),
                      DataCell(Text(rate)),
                      DataCell(Text('\$$then25_1_22 NZD')),
                      DataCell(Text('\$${now25_1_22.toStringAsFixed(2)} NZD')),
                      DataCell(Text('\$${gain25_1_22.toStringAsFixed(2)} NZD')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('18/2/22')),
                      DataCell(Text('$feb18_2_22')),
                      DataCell(Text(rate)),
                      DataCell(Text('\$$then18_2_22 NZD')),
                      DataCell(Text('\$${now18_2_22.toStringAsFixed(2)} NZD')),
                      DataCell(Text('\$${gain18_2_22.toStringAsFixed(2)} NZD')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('19/2/22')),
                      DataCell(Text('$feb19_2_22')),
                      DataCell(Text(rate)),
                      DataCell(Text('\$$then19_2_22 NZD')),
                      DataCell(Text('\$${now19_2_22.toStringAsFixed(2)} NZD')),
                      DataCell(Text('\$${gain19_2_22.toStringAsFixed(2)} NZD')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('21/2/22')),
                      DataCell(Text('$feb21_2_22_1')),
                      DataCell(Text(rate)),
                      DataCell(Text('\$$then21_2_22_1 NZD')),
                      DataCell(Text('\$${now21_2_22_1.toStringAsFixed(2)} NZD')),
                      DataCell(Text('\$${gain21_2_22_1.toStringAsFixed(2)} NZD')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('21/2/22')),
                      DataCell(Text('$feb21_2_22_2')),
                      DataCell(Text(rate)),
                      DataCell(Text('\$$then21_2_22_2 NZD')),
                      DataCell(Text('\$${now21_2_22_2.toStringAsFixed(2)} NZD')),
                      DataCell(Text('\$${gain21_2_22_2.toStringAsFixed(2)} NZD')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('23/2/22')),
                      DataCell(Text('$feb23_2_22')),
                      DataCell(Text(rate)),
                      DataCell(Text('\$$then23_2_22 NZD')),
                      DataCell(Text('\$${now23_2_22.toStringAsFixed(2)} NZD')),
                      DataCell(Text('\$${gain23_2_22.toStringAsFixed(2)} NZD')),
                    ]),
                  ],
                )
              );
              }
              else if
                (snapshot.hasError){
                  throw Exception('error in program');
                }
              
              else {
                return CircularProgressIndicator();
              }
          }
        )
      )
    );
  }
}