// ignore_for_file: prefer_const_constructors
import 'package:cryptos101/themes.dart';
import 'package:cryptos101/views/alts.dart';
import 'package:cryptos101/views/btc.dart';
import 'package:cryptos101/views/eth.dart';
import 'package:cryptos101/views/rate_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptos101',
      theme: Themes.light,
      home: HomeView(),
      routes: <String, WidgetBuilder>{
        '/btc': (BuildContext context) => btcView(),
        '/eth': (BuildContext context) => ethView(),
        '/alts': (BuildContext context) => altsView(),
        '/calculator': (BuildContext context) => CalculatorView(),
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
    var theme = Theme.of(context);
    return Scaffold(
        backgroundColor: Colors.lime.shade100,
        appBar: AppBar(
          leading:
              Icon(Icons.donut_small_sharp, color: Colors.blueGrey.shade700),
          title: Text('LIME',
              style: TextStyle(
                  color: Colors.blueGrey.shade700,
                  fontWeight: FontWeight.w900)),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              SizedBox(height: 10),
              SizedBox(
                  height: 50,
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
              SizedBox(height: 10),

              Text('Current Market Rates',
                  style: TextStyle(
                      color: Colors.blueGrey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 17)),
              SizedBox(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99)),
                      padding: EdgeInsets.all(17)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/calculator');
                  },
                  child: Text(
                    'Calculator',
                  )),
              SizedBox(height: 100),
              Container(
                color: Colors.lime,
                height: 12,
              ),
              // SizedBox(height: 50),
              Container(
                  height: 400,
                  color: Colors.lime.shade200,
                  child: Column(children: [
                    SizedBox(height: 50),
                    Text('Portfolio',
                        style: TextStyle(
                            color: Colors.blueGrey.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                    SizedBox(height: 40),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Spacer(flex: 3),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/btc');
                          },
                          child: Text(
                            'BTC',
                          )),
                      // ETH
                      Spacer(flex: 1),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/eth');
                          },
                          child: Text(
                            'ETH',
                          )),

                      Spacer(flex: 1),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/alts');
                          },
                          child: Text(
                            'ALTS',
                          )),
                      Spacer(flex: 3),
                    ])
                  ]))
            ])));
  }
}
