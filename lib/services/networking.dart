import 'dart:convert';
import 'package:http/http.dart' as http;

// Coin API URLS For dif cryptos into NZD
// var apiKey = '5FD2E560-74A0-413D-A23D-F908EA582C1C';
// LUNA:
//var lunaApiUrl = 'https://rest.coinapi.io/v1/exchangerate/LUNA/NZD?apikey=5FD2E560-74A0-413D-A23D-F908EA582C1C';
 //SOL:








Future<CoinData> getCoinRates() async {
  var coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate/LUNA/NZD?apikey=5FD2E560-74A0-413D-A23D-F908EA582C1C';
  var response = await http.get(Uri.parse(coinApiUrl));

  if (response.statusCode == 200){
    CoinData coinData = CoinData.fromJson(jsonDecode(response.body));
    print (coinData.rate);
    return coinData;

  } else {
    print(response.statusCode);
    throw Exception('error in your request');
  }
}

class CoinData {
  double rate;

  CoinData({
    required this.rate
  });

  factory CoinData.fromJson(Map<String, dynamic> json){
    return CoinData(
      rate: json['rate'],
    );
  }
}
