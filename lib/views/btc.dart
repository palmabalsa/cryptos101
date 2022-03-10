import 'package:flutter/material.dart';

class btcView extends StatefulWidget {
  btcView({Key? key}) : super(key: key);

  @override
  State<btcView> createState() => _btcViewState();
}

class _btcViewState extends State<btcView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BTC'),
      ),
      body: Center(
        child: SizedBox(
          child: DataTable(
            columns: [
              DataColumn(label: Text('AMOUNT')),
              DataColumn(label: Text('PRICE THEN')),
              DataColumn(label: Text('PRICE NOW')),
              // DataColumn(label: Text('PRICE NOW')),
              // DataColumn(label: Text('PRICE NOW')),
              // DataColumn(label: Text('GAIN/LOSS?')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('BTC')),
                DataCell(Text('25/5')),
                DataCell(Text('BTC')),
                // DataCell(Text('25/5')),
                // DataCell(Text('BTC')),
                // DataCell(Text('25/5')),
              ]),
              DataRow(cells: [
                DataCell(Text('BTC')),
                DataCell(Text('27/5')),
                DataCell(Text('BTC')),
                // DataCell(Text('25/5')),
                // DataCell(Text('BTC')),
                // DataCell(Text('25/5')),
              ]),
              DataRow(cells: [
                DataCell(Text('BTC')),
                DataCell(Text('28/5')),
                DataCell(Text('BTC')),
                // DataCell(Text('25/5')),
                // DataCell(Text('BTC')),
                // DataCell(Text('25/5')),
              ]),
            ],
          )
        )
      )
    );
  }
}