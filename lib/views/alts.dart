import 'package:flutter/material.dart';

class altsView extends StatefulWidget {
  const altsView({ Key? key }) : super(key: key);

  @override
  State<altsView> createState() => _altsViewState();
}

class _altsViewState extends State<altsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALTS'),
      ),
      body: Center(
        child: InteractiveViewer(
          constrained: false,
          child: DataTable(
                columns: [
                DataColumn(label: Text('COIN')),
                DataColumn(label: Text('DATE')),
                DataColumn(label: Text('AMOUNT')),
                DataColumn(label: Text('THEN')),
                DataColumn(label: Text('NOW')),
                DataColumn(label: Text('GAIN?')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('LUNA')),
                  DataCell(Text('22/02/22')), 
                  DataCell(Text('5.30LUNA')),
                  DataCell(Text('399.63')), 
                  DataCell(Text('-')), //take coin api data here
                  DataCell(Text('-')),
                ]),
                DataRow(cells: [
                  DataCell(Text('DOT')),
                  DataCell(Text('22/02/22')),
                  DataCell(Text('15.70DOT')), //current price coin api goes here
                  DataCell(Text('402.63')),
                  DataCell(Text('-')),
                  DataCell(Text('-')),
                ]),
                DataRow(cells: [
                  DataCell(Text('SOLANA')),
                  DataCell(Text('22/02/22')),
                  DataCell(Text('3.3SOL')),
                  DataCell(Text('447.70')),
                  DataCell(Text('-')),
                  DataCell(Text('-')),
                ]),
                DataRow(cells: [
                  DataCell(Text('FANTOM')),
                  DataCell(Text('22/02/22')), 
                  DataCell(Text('174FTM')),
                  DataCell(Text('402.96')), 
                  DataCell(Text('-')), //take coin api data here
                  DataCell(Text('-')),
                ]),
                DataRow(cells: [
                  DataCell(Text('POLYGON')),
                  DataCell(Text('22/02/22')), 
                  DataCell(Text('188MATIC')),
                  DataCell(Text('400.83')), 
                  DataCell(Text('-')), //take coin api data here
                  DataCell(Text('-')),
                ]),
            ],
          )
        )
      )
    );
  }
}