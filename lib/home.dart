import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String output = '0';
  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  buttonPressed(String buttonText) {
    if (buttonText == 'CLEAR') {
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'X' ||
        buttonText == '/') {
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    } else if (buttonText == '.') {
      if (_output.contains('.')) {
        print('Already contains a decimal');
        return;
      }
      else {
      _output = _output + buttonText;
    }
    } else if (buttonText == '=') {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand='';
    } 
    else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Text(
                output,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            children: [
              button('7'),
              button('8'),
              button('9'),
              button('/'),
            ],
          ),
          Row(
            children: [
              button('4'),
              button('5'),
              button('6'),
              button('X'),
            ],
          ),
          Row(
            children: [
              button('1'),
              button('2'),
              button('3'),
              button('-'),
            ],
          ),
          Row(
            children: [
              button('.'),
              button('0'),
              button('00'),
              button('+'),
            ],
          ),
          Row(
            children: [
              button('CLEAR'),
              button('='),
            ],
          ),
        ],
      ),
    );
  }

  Widget button(String text) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24),
        onPressed: () {
          buttonPressed(text);
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
