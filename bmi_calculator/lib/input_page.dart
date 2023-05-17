import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ReusableCard(customColor: Color(0xFF1D1E33)),
                  ),
                  Expanded(
                    flex: 1,
                    child: ReusableCard(customColor: Color(0xFF1D1E33)),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Expanded(
                flex: 1,
                child: ReusableCard(customColor: activeCardColor),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ReusableCard(customColor: activeCardColor),
                  ),
                  Expanded(
                    flex: 1,
                    child: ReusableCard(customColor: activeCardColor),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: bottomContainerHeight,
              color: bottomContainerColor,
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  Color customColor;

  ReusableCard({required this.customColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: customColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
