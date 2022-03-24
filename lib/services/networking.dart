import 'dart:convert';
import 'package:http/http.dart' as http;


Future<CoinData> getBtcRates() async {

  var apiUrl = 'https://rest.coinapi.io/v1/exchangerate/BTC/NZD?apikey=5FD2E560-74A0-413D-A23D-F908EA582C1C';

  var response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200){
    CoinData btcData = CoinData.fromJson(jsonDecode(response.body));
    print (btcData.rate);
    return btcData;
  }

  else {
    print (response.statusCode);
    throw Exception('error : ${response.statusCode}');
  }
  
}
















Future<List<double>> getAltRates() async {
  String coinApiKey = '5FD2E560-74A0-413D-A23D-F908EA582C1C';
  List<String> cryptosList = ['LUNA', 'DOT', 'SOL', 'FTM', 'MATIC'];
  List<String> cryptoUrls = [];

  for (String crypto in cryptosList) {
    var newUrl = 'https://rest.coinapi.io/v1/exchangerate/$crypto/NZD?apikey=$coinApiKey';
    cryptoUrls.add(newUrl);
  }
  
  List<double> coinRates = [];


  for (String cryptoUrl in cryptoUrls) {
    var response = await http.get(Uri.parse(cryptoUrl));
    
    if (response.statusCode == 200){
    CoinData coinData = CoinData.fromJson(jsonDecode(response.body));
    print (coinData.rate);
    double rateNow = coinData.rate.toDouble();
    coinRates.add(rateNow);
    
    } else {
      print(response.statusCode);
      throw Exception('there is an error in your request. HTTP: ${response.statusCode}');
    }
  }
  print (coinRates);
  return coinRates;
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

  Map<String, dynamic> toJson() => {
    'rate' : rate,
  };
}








// original that works

// Future<CoinData> getCoinRates() async {
//   String apiUrl = 'https://rest.coinapi.io/v1/exchangerate/LUNA/NZD?apikey=5FD2E560-74A0-413D-A23D-F908EA582C1C';
//   var response = await http.get(Uri.parse(apiUrl));

//   if (response.statusCode == 200){
//     CoinData coinData = CoinData.fromJson(jsonDecode(response.body));
//     // OR
//     // Map<String, dynamic> coinDataMap = jsonDecode(response.body);
//     // var coinData = CoinData.fromJson(coinDataMap);
    
//     // coinRates.add(coinData.rate);

//     print(coinData.rate);
//     print('hello ${coinData.rate}!');
//     return coinData;

//   } else {
//     print(response.statusCode);
//     throw Exception('error in your request');
//   }
// }

