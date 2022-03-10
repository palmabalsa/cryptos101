import 'dart:convert';
import 'package:http/http.dart' as http;


Future<CoinData> getCoinRates() async {
  var coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate/LUNA/NZD?apikey=5FD2E560-74A0-413D-A23D-F908EA582C1C';
  var response = await http.get(Uri.parse(coinApiUrl));

  if (response.statusCode == 200){
    CoinData coinData = CoinData.fromJson(jsonDecode(response.body));
    print (coinData.exRate);
    return coinData;

  } else {
    print(response.statusCode);
    throw Exception('error in your request');
  }
}

class CoinData {
  double exRate;

  CoinData({
    required this.exRate
  });

  factory CoinData.fromJson(Map<String, dynamic> json){
    return CoinData(
      exRate: json['rate']
    );
  }
}