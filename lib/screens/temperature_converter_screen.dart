import 'package:flutter/material.dart';

class TemperatureConverterScreen extends StatefulWidget {
  @override
  _TemperatureConverterScreenState createState() => _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState extends State<TemperatureConverterScreen> {
  final TextEditingController celsiusController = TextEditingController();
  String result = "";

  void convertToFahrenheit() {
    if (celsiusController.text.isEmpty) {
      setState(() {
        result = "Masukkan suhu dalam °C!";
      });
      return;
    }
    double celsius = double.parse(celsiusController.text);
    double fahrenheit = (celsius * 9 / 5) + 32;
    setState(() {
      result = "${celsius}°C = ${fahrenheit.toStringAsFixed(2)}°F";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Suhu'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: celsiusController,
              decoration: InputDecoration(labelText: 'Suhu (°C)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertToFahrenheit,
              child: Text('Konversi ke °F'),
            ),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}