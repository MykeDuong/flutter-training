import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: BallPage(),
    ),
  );
}

class BallPage extends StatefulWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  State<BallPage> createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  var ball = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Magic 8 Ball'),
          backgroundColor: Colors.blue[900],
        ),
        body: Container(
          color: Colors.blue,
          child: Center(
            child: TextButton(
              onPressed: () {
                setState(() {
                  ball = Random().nextInt(5) + 1;
                });
              },
              child: Image.asset('images/ball$ball.png'),
            ),
          ),
        ),
      ),
    );
  }
}
