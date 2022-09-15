import 'package:cryptos101/services/networking.dart';
import 'package:flutter/material.dart';

class ethView extends StatefulWidget {
  const ethView({Key? key}) : super(key: key);

  @override
  State<ethView> createState() => _ethViewState();
}

class _ethViewState extends State<ethView> {
  late Future<CoinData> ethNow;

  @override
  void initState() {
    super.initState();
    ethNow = getCoinRates('ETH', 'NZD');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ETH'),
        ),
        body: Center(
            child: FutureBuilder<CoinData>(
                future: ethNow,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // create these vars
                    double ethRate = snapshot.data!.rate;
                    String rate = snapshot.data!.rate.toStringAsFixed(2);

                    // 25/1/22 -SGD PURCHASE
                    double jan25_1_22 = 0.3;
                    double then25_1_22 =
                        1031.46; //rough currency conversion from $974.96SGD
                    double now25_1_22 = jan25_1_22 * ethRate;
                    double gain25_1_22 = now25_1_22 - then25_1_22;

                    // 9/2/22
                    double feb9_2_22 = 0.25;
                    double then9_2_22 = 1188.62;
                    double now9_2_22 = feb9_2_22 * ethRate;
                    double gain9_2_22 = now9_2_22 - then9_2_22;

                    // 22/2/22
                    double feb22_2_22 = 0.245;
                    double then22_2_22 = 1018.44;
                    double now22_2_22 = feb22_2_22 * ethRate;
                    double gain22_2_22 = now22_2_22 - then22_2_22;

                    // 23/2/22
                    double feb23_2_22 = 0.148;
                    double then23_2_22 = 1018.44;
                    double now23_2_22 = feb23_2_22 * ethRate;
                    double gain23_2_22 = now23_2_22 - then23_2_22;

                    return InteractiveViewer(
                        constrained: false,
                        child: DataTable(columns: [
                          DataColumn(label: Text('DATE')),
                          DataColumn(label: Text('AMOUNT')),
                          DataColumn(label: Text('RATE')),
                          DataColumn(label: Text('THEN')),
                          DataColumn(label: Text('NOW')),
                          DataColumn(label: Text('GAIN?')),
                        ], rows: [
                          DataRow(cells: [
                            DataCell(Text('25/1/22')),
                            DataCell(Text(jan25_1_22.toString())),
                            DataCell(Text(rate)),
                            DataCell(Text('\$$then25_1_22 NZD')),
                            DataCell(
                                Text('\$${now25_1_22.toStringAsFixed(2)} NZD')),
                            DataCell(Text(
                                '\$${gain25_1_22.toStringAsFixed(2)} NZD')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('9/2/22')),
                            DataCell(Text(feb9_2_22.toString())),
                            DataCell(Text(rate)),
                            DataCell(Text('\$$then9_2_22 NZD')),
                            DataCell(
                                Text('\$${now9_2_22.toStringAsFixed(2)} NZD')),
                            DataCell(
                                Text('\$${gain9_2_22.toStringAsFixed(2)} NZD')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('22/2/22')),
                            DataCell(Text(feb22_2_22.toString())),
                            DataCell(Text(rate)),
                            DataCell(Text('\$$then22_2_22 NZD')),
                            DataCell(
                                Text('\$${now22_2_22.toStringAsFixed(2)} NZD')),
                            DataCell(Text(
                                '\$${gain22_2_22.toStringAsFixed(2)} NZD')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('23/2/22')),
                            DataCell(Text(feb23_2_22.toString())),
                            DataCell(Text(rate)),
                            DataCell(Text('\$$then23_2_22 NZD')),
                            DataCell(
                                Text('\$${now23_2_22.toStringAsFixed(2)} NZD')),
                            DataCell(Text(
                                '\$${gain23_2_22.toStringAsFixed(2)} NZD')),
                          ]),
                        ]));
                  } else if (snapshot.hasError) {
                    throw Exception('ERROR');
                  }
                  return CircularProgressIndicator();
                })));
  }
}
