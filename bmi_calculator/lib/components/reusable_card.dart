import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color customColor;
  final Widget? child;
  final void Function()? onTap;

  ReusableCard({super.key, required this.customColor, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        child: child,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: customColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
