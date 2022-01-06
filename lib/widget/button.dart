import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String text;

  final Function? callback;

  Button({required this.text, this.callback});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: OutlinedButton(
          
            onPressed: () => callback!(text),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            )));
  }
}
