import 'package:flutter/material.dart';
import 'bmi_calculator_screen.dart';
import 'calculator_screen.dart';
import 'temperature_converter_screen.dart';
import 'currency_converter_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Kalkulator Numeric'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CalculatorScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Kalkulator BMI'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => BMICalculatorScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Konversi Suhu'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => TemperatureConverterScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Konversi Mata Uang'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CurrencyConverterScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}