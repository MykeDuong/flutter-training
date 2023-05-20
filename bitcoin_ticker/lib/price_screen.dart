import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'card.dart';
import 'package:bitcoin_ticker/coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  Map<String, double> prices = {};

  Widget getAndroidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];

      var newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );

      dropdownItems.add(newItem);
    }
    return DropdownButton(
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
        });
      },
    );
  }

  Widget getIOSPicker() {
    List<Text> pickerItems = [];

    for (int i = 0; i < currenciesList.length; i++) {
      pickerItems.add(Text(currenciesList[i]));
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        selectedCurrency = currenciesList[selectedIndex];
        getPrice(selectedCurrency);
      },
      children: pickerItems,
    );
  }

  void getPrice(String currency) async {
    var newPrices = await CoinData().getData(currency);
    setState(() {
      prices = newPrices;
    });
  }

  @override
  void initState() {
    super.initState();
    getPrice(selectedCurrency);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(children: [
              ExchangeRateCard(
                  crypto: 'BTC',
                  currency: selectedCurrency,
                  rate: prices['BTC']),
              ExchangeRateCard(
                  crypto: 'ETH',
                  currency: selectedCurrency,
                  rate: prices['ETH']),
              ExchangeRateCard(
                  crypto: 'LTC',
                  currency: selectedCurrency,
                  rate: prices['LTC']),
            ]),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? getIOSPicker() : getAndroidDropdown(),
          ),
        ],
      ),
    );
  }
}
