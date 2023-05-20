import 'package:flutter/material.dart';

class ExchangeRateCard extends StatelessWidget {
  final String crypto;
  final String currency;
  final double? rate;

  ExchangeRateCard(
      {required this.crypto, required this.currency, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $crypto = ${rate != null ? rate!.toStringAsFixed(2) : '?'} $currency',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
