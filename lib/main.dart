import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _dieRoll = 0;
  int _numOfSides = 6;
  final _random = new Random();
  final sidesTextField = TextEditingController(text: "6");

  void _rollDie() {
    setState(() {
      _numOfSides = int.parse(sidesTextField.text);
      _dieRoll = _random.nextInt(_numOfSides) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dice Roller'),
        ),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text (
              "Die Roll",
              style: Theme.of(context).textTheme.headline4,
            ),
            Text (
              _dieRoll.toString(),
              style: Theme.of(context).textTheme.headline2,
            ),
            ElevatedButton(
              child: Text('Roll'),
              onPressed: _rollDie,
            ),
            Text(
              'Sides:',
              style: Theme.of(context).textTheme.headline2,
            ),
            TextField(
              controller: sidesTextField,
              style: Theme.of(context).textTheme.headline4,
            ),
          ]
        )
      )
    );
  }

}
