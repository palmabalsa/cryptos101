import 'package:cryptos101/views/alts.dart';
import 'package:cryptos101/views/btc.dart';
import 'package:cryptos101/views/eth.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptos101',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: HomeView(),
      routes: <String, WidgetBuilder> {
        '/btc' : (BuildContext context) => btcView(),
        '/eth' : (BuildContext context) => ethView(),
        '/alts' : (BuildContext context) => altsView(),
      },
    );
  }
}

class HomeView extends StatefulWidget {


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cryptos101'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // convert this to a ButtonBar?
            //BTC
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/btc');
              },
              child: Text('BTC')),
              // ETH
              ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/eth');
              },
              child: Text('ETH')),
              // ALTS
              ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/alts');
              },
              child: Text('ALTS')),
          ]
        )
      )
    );
  }
}
