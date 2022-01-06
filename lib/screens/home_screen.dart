import 'dart:html';

import 'package:flutter/material.dart';
import 'package:my_calculator/widget/button.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? firstNum = 0;
  int? secondNum = 0;
  String texttodisplay = '';
  String history = '';
  String res = '';
  String? operatortoperform;

  void buttonClicked(String btnvalue) {
    if (btnvalue == 'C') {
      texttodisplay = '';
      firstNum = 0;
      secondNum = 0;
      history = '';
      res = '';
    } else if (btnvalue == '+' ||
        btnvalue == '-' ||
        btnvalue == 'X' ||
        btnvalue == '/') {
      firstNum = int.parse(texttodisplay);
      res = '';
      operatortoperform = btnvalue;
    } else if (btnvalue == '=') {
      secondNum = int.parse(texttodisplay);

      if (operatortoperform == '+') {
        res = (firstNum! + secondNum!).toString();
        history = firstNum.toString() +
            operatortoperform.toString() +
            secondNum.toString();
      }
      if (operatortoperform == '-') {
        res = (firstNum! - secondNum!).toString();
        history = firstNum.toString() +
            operatortoperform.toString() +
            secondNum.toString();
      }
      if (operatortoperform == 'X') {
        res = (firstNum! * secondNum!).toString();
        history = firstNum.toString() +
            operatortoperform.toString() +
            secondNum.toString();
      }
      if (operatortoperform == '/') {
        res = (firstNum! / secondNum!).toString();
        history = firstNum.toString() +
            operatortoperform.toString() +
            secondNum.toString();
      }
    } else {
      res = int.parse(texttodisplay + btnvalue).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My Calculator")),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    history,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(8),
                child: Text(
                  texttodisplay,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(children: [
                Button(
                  text: "9",
                  callback: buttonClicked,
                ),
                Button(
                  text: "8",
                  callback: buttonClicked,
                ),
                Button(
                  text: "7",
                  callback: buttonClicked,
                ),
                Button(
                  text: "+",
                  callback: buttonClicked,
                ),
              ]),
              Row(children: [
                Button(
                  text: "6",
                  callback: buttonClicked,
                ),
                Button(text: "5", callback: buttonClicked),
                Button(text: "4", callback: buttonClicked),
                Button(text: "-", callback: buttonClicked),
              ]),
              Row(children: [
                Button(text: "3", callback: buttonClicked),
                Button(text: "2", callback: buttonClicked),
                Button(text: "1", callback: buttonClicked),
                Button(text: "X", callback: buttonClicked),
              ]),
              Row(children: [
                Button(text: "C", callback: buttonClicked),
                Button(text: "0", callback: buttonClicked),
                Button(text: "=", callback: buttonClicked),
                Button(text: "/", callback: buttonClicked),
              ])
            ],
          ),
        ));
  }
}
