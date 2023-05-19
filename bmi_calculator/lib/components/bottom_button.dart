import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final void Function() onTap;
  final String text;

  BottomButton({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: kBottomContainerHeight,
        color: kBottomContainerColor,
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(text, style: kLargeButtonTextStyle),
        ),
      ),
    );
  }
}
