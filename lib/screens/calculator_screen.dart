import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';
  double _firstOperand = 0;
  String _currentOperator = '';

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => buttonPressed(buttonText),
        // padding: const EdgeInsets.all(24), // Issue is here
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 20),
        ), // Text
      ), // OutlinedButton
    ); // Expanded
  }

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _display = '0'; // Clear the display
        _currentOperator = '';
        _firstOperand = 0;
      } else if (buttonText == '=') {
        // Calculate the result based on the operator
        if (_currentOperator == '+') {
          _display = (_firstOperand + double.parse(_display)).toString();
        } else if (_currentOperator == '-') {
          _display = (_firstOperand - double.parse(_display)).toString();
        } else if (_currentOperator == '*') {
          _display = (_firstOperand * double.parse(_display)).toString();
        } else if (_currentOperator == '/') {
          if (double.parse(_display) != 0) {
            _display = (_firstOperand / double.parse(_display)).toString();
          } else {
            _display = "Error: Division by zero";
          }
        }
        _firstOperand = 0;
        _currentOperator = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        _firstOperand = double.parse(_display);
        _currentOperator = buttonText;
        _display = '0';
      } else {
        if (_display == '0') {
          _display = buttonText;
 } else {
          _display += buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(24),
            alignment: Alignment.centerRight,
            child: Text(
              _display,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: <Widget>[
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('*'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('C'),
              buildButton('0'),
              buildButton('='),
              buildButton('+'),
            ],
          ),
        ],
      ),
    );
  }
}