import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey = '2E65B457-8255-4FCB-B424-A30BCF8E9B66';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<Map<String, double>> getData(String currency) async {
    Map<String, double> prices = {};
    for (String crypto in cryptoList) {
      Uri url = Uri.https('rest.coinapi.io',
          '/v1/exchangerate/$crypto/$currency', {'apikey': apiKey});

      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        prices[crypto] = data['rate'];
      }
    }

    return prices;
  }
}
