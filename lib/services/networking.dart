import 'dart:convert';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;

//  LOOPING THE FUTURES/USING LOOPS TO GO THROUGH THE COIN TYPES  ============ //////////////////////////////////////
// Future<CoinData> getCoinRates() async {
//   var coinApiKey = '5FD2E560-74A0-413D-A23D-F908EA582C1C';
//   List<String> cryptosList = ['LUNA', 'DOT', 'SOL', 'FTM', 'MATIC'];
//   List<String> cryptoUrls = [];


//   for (String crypto in cryptosList) {
//     var newUrl = 'https://rest.coinapi.io/v1/exchangerate/$crypto/NZD?apikey=$coinApiKey';
//     cryptoUrls.add(newUrl);
//   }

//   List<CoinData> coinRates = [];

//   for (String cryptoUrl in cryptoUrls) {
//     var response = await http.get(Uri.parse(cryptoUrl));
    
//     if (response.statusCode == 200){
//     CoinData coinData = CoinData.fromJson(jsonDecode(response.body));
//     print (coinData.rate);
//     coinRates.add(coinData);
    
//     } else {
//       print(response.statusCode);
//       throw Exception('error in your request');
//     }
//   }
//   print (coinRates);
//   return coinRates[0];
// }


// FUTUREGROUPS ====== THIS WORKS BUT HOW DO YOU RETURN THE DATA? ////////////////////////////////
// dynamic ffutures() {
//   Future<dynamic> lunaFuture = getCoinRates('https://rest.coinapi.io/v1/exchangerate/LUNA/NZD?apikey=5FD2E560-74A0-413D-A23D-F908EA582C1C');
//   Future<dynamic> dotFuture = getCoinRates('https://rest.coinapi.io/v1/exchangerate/DOT/NZD?apikey=5FD2E560-74A0-413D-A23D-F908EA582C1C');
//   FutureGroup coinFutures = FutureGroup();
//   coinFutures.add(lunaFuture);
//   coinFutures.add(dotFuture);
//   coinFutures.close();
//   coinFutures.future.then((data) => {print(data)});
// }
// Future<dynamic> getCoinRates(apiUrl) async {
//   var response = await http.get(Uri.parse(apiUrl));

//   if (response.statusCode == 200){
//     CoinData coinData = CoinData.fromJson(jsonDecode(response.body));
//     print (coinData.rate);
//     return coinData.rate;

//   } else {
//     print(response.statusCode);
//     throw Exception('error in your request');
//   }
// }

// class CoinData {
//   double rate;

//   CoinData({
//     required this.rate
//   });

//   factory CoinData.fromJson(Map<String, dynamic> json){
//     return CoinData(
//       rate: json['rate'],
//     );
//   }
// }
  

// working code: original one call future ===== /////////////////////////
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

Future<CoinData> getDotRates() async {
  var coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate/DOT/NZD?apikey=5FD2E560-74A0-413D-A23D-F908EA582C1C';
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
