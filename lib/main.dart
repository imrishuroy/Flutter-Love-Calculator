import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Love Calculator',
      home: Scaffold(
        // backgroundColor: Colors.pinkAccent,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Love Calculator'),
        ),
        body: LoveCalculator(),
      ),
    );
  }
}

class LoveCalculator extends StatefulWidget {
  @override
  _LoveCalculatorState createState() => _LoveCalculatorState();
}

class _LoveCalculatorState extends State<LoveCalculator> {
  String yourName;

  String parterName;

  String message;

  int loveScore;
  String score = '';
  //calculation

  String calculate() {
    setState(() {
      loveScore = Random().nextInt(100) + 1;

      // print(loveScore);

      // logic for invalid input
      if (yourName == '') {
        return message = 'Your name can\'t be empty';
      } else if (parterName == '') {
        return message = 'Parter name can\'t be empty';
      }

      if (loveScore > 80) {
        return message = 'You are made for each other';
      } else if (loveScore > 40 && loveScore <= 80) {
        return message = 'You guys are really awesome';
      } else if (loveScore > 15) {
        return message = 'You have to work on your relationship';
      } else {
        return message = 'Search for another one';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              height: 250,
              width: 250,
              child: Image.asset(
                'images/heart.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            'Let\'s Check Your Love Score :-',
            style: TextStyle(
              fontSize: 27,
              fontFamily: 'Lobster',
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              onChanged: (value) {
                yourName = value;
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Colors.red,
                  ),
                ),
                hintText: 'Enter your name...',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 30),
            child: TextField(
              onChanged: (value) {
                parterName = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your name of loved once...',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          RaisedButton(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            onPressed: () {
              // print(yourName);
              // print(parterName);

              calculate();
              setState(() {
                if (yourName != null && parterName != null) {
                  yourName = '';
                  parterName = '';
                }
              });
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  elevation: 6,
                  content: Text(
                    message,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
            color: Colors.red,
            child: Text(
              'Calculate',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '${score = loveScore.toString()}%',
            style: TextStyle(
              fontFamily: 'Lobster',
              fontSize: 60,
            ),
          ),
        ],
      ),
    );
  }
}
