import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String result = "";

  void calculateBMI() {
    if (heightController.text.isEmpty || weightController.text.isEmpty) {
      setState(() {
        result = "Masukkan tinggi dan berat!";
      });
      return;
    }
    double height = double.parse(heightController.text) / 100; // convert cm to meters
    double weight = double.parse(weightController.text);
    double bmi = weight / (height * height);
    setState(() {
      result = "BMI: ${bmi.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator BMI'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: heightController,
              decoration: InputDecoration(labelText: 'Tinggi (cm)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: weightController,
              decoration: InputDecoration(labelText: 'Berat (kg)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('Hitung BMI'),
            ),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}