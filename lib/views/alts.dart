import 'package:cryptos101/services/networking.dart';
import 'package:flutter/material.dart';

class altsView extends StatefulWidget {

  @override
  State<altsView> createState() => _altsViewState();
}

class _altsViewState extends State<altsView> {
  late Future<List<double>> newData;

@override
  void initState() {
    super.initState();
    print('is this working');
    newData = getAltRates();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALTS'),
      ),
      body: Center(
          child: FutureBuilder<List<double>>(
          future: newData,
          builder: (context, snapshot){
          

            if (snapshot.hasData) {

              // LUNA/TERRA:
              double lunaQuantity = 2.80; //how much Luna i bought, the quantity in Luna $
              double luna22_2_22= 399.63;   //Price of my Luna on this date in NZD
              double lunaRate = snapshot.data![0]; //API Data - Rate of Luna today in NZD
              double lunaNow = lunaQuantity*lunaRate;  //Price of my Luna today
              double lunaChange = lunaNow - luna22_2_22; //gain or loss?

              // POLKADOT:
              double dotQuantity = 15.70; //how much i bought, the quantity in dot $
              double dot22_2_22= 402.63;   //Price of my dot on this date in NZD
              double dotRate = snapshot.data![1]; // API Data
              double dotNow = dotQuantity*dotRate;  //Price of my dot today
              double dotChange = dotNow - dot22_2_22; //gain or loss

              // SOLANA:
              double solQuantity = 3.30; //how much i bought, the quantity in sol $
              double sol22_2_22= 447.70;   //Price of my sol on this date in NZD
              double solRate = snapshot.data![2]; // APi data
              double solNow = solQuantity*solRate;  //Price of my sol today
              double solChange = solNow - sol22_2_22; //gain or loss?

              // FANTOM:
              double ftmQuantity = 174; //how much i bought, the quantity in FTM $
              double ftm22_2_22= 402.96;   //Price of my ftm on this date in NZD
              double ftmRate = snapshot.data![3]; //APi data
              double ftmNow = ftmQuantity*ftmRate;  //Price of my ftm today
              double ftmChange = ftmNow - ftm22_2_22; //gain or loss?

               // POLYGON/MATTIC:
              double polyQuantity = 188; //how much i bought, the quantity in Poly $
              double poly22_2_22= 400.83;   //Price of my poly on this date in NZD
              double polyRate = snapshot.data![4]; //APi data
              double polyNow = polyQuantity*polyRate;  //Price of my poly today
              double polyChange = polyNow - poly22_2_22; //gain or loss?

              
              return InteractiveViewer(
                constrained: false,
                child: DataTable(
                          columns: [
                          DataColumn(label: Text('COIN')),
                          DataColumn(label: Text('DATE')),
                          DataColumn(label: Text('#')),
                          DataColumn(label: Text('RATE')),
                          DataColumn(label: Text('THEN')),
                          DataColumn(label: Text('NOW')),
                          DataColumn(label: Text('GAIN?')),
                          ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text('LUNA')),
                            DataCell(Text('22/02/22')), 
                            DataCell(Text('${lunaQuantity.toStringAsFixed(2)} LUNA')),
                            DataCell(Text('\$${lunaRate.toStringAsFixed(2)} NZD')), 
                            DataCell(Text('\$${luna22_2_22.toStringAsFixed(2)}')),
                            DataCell(Text('\$${lunaNow.toStringAsFixed(2)}')),
                            DataCell(Text('\$${lunaChange.toStringAsFixed(2)}')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('DOT')),
                            DataCell(Text('22/02/22')),
                            DataCell(Text('${dotQuantity.toStringAsFixed(2)} DOT')),
                            DataCell(Text('\$${dotRate.toStringAsFixed(2)} NZD')),
                            DataCell(Text('\$${dot22_2_22.toStringAsFixed(2)}')),
                            DataCell(Text('\$${dotNow.toStringAsFixed(2)}')),
                            DataCell(Text('\$${dotChange.toStringAsFixed(2)}')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('SOLANA')),
                            DataCell(Text('22/02/22')),
                            DataCell(Text('${solQuantity.toStringAsFixed(2)} SOL')),
                            DataCell(Text('\$${solRate.toStringAsFixed(2)} NZD')),
                            DataCell(Text('\$${sol22_2_22.toStringAsFixed(2)}')),
                            DataCell(Text('\$${solNow.toStringAsFixed(2)}')),
                            DataCell(Text('\$${solChange.toStringAsFixed(2)}')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('FANTOM')),
                            DataCell(Text('22/02/22')), 
                            DataCell(Text('${ftmQuantity.toStringAsFixed(2)} FTM')),
                            DataCell(Text('\$${ftmRate.toStringAsFixed(2)} NZD')),
                            DataCell(Text('\$${ftm22_2_22.toStringAsFixed(2)}')),
                            DataCell(Text('\$${ftmNow.toStringAsFixed(2)}')),
                            DataCell(Text('\$${ftmChange.toStringAsFixed(2)}')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('POLYGON')),
                            DataCell(Text('22/02/22')), 
                            DataCell(Text('${polyQuantity.toStringAsFixed(2)} MATIC')),
                            DataCell(Text('\$${polyRate.toStringAsFixed(2)} NZD')),
                            DataCell(Text('\$${poly22_2_22.toStringAsFixed(2)}')),
                            DataCell(Text('\$${polyNow.toStringAsFixed(2)}')),
                            DataCell(Text('\$${polyChange.toStringAsFixed(2)}')),
                          ]),
                      ],
                )
              );
          
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
                }
                else {
            return const CircularProgressIndicator();
            }
          } 
        )
      )
    );
  }
}