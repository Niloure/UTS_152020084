import 'package:flutter/material.dart';

class CurrencyConverterScreen extends StatefulWidget {
  @override
  _CurrencyConverterScreenState createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final TextEditingController currencyController = TextEditingController();
  String result = "";

  void convertCurrency() {
    if (currencyController.text.isEmpty) {
      setState(() {
        result = "Masukkan jumlah dalam USD!";
      });
      return;
    }
    double amount = double.parse(currencyController.text);
    double conversionRate = 15000; // Contoh: 1 USD = 15000 IDR
    double convertedAmount = amount * conversionRate;
    setState(() {
      result = "${amount} USD = ${convertedAmount.toStringAsFixed(2)} IDR";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Mata Uang'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: currencyController,
              decoration: InputDecoration(labelText: 'Jumlah (USD)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertCurrency,
              child: Text('Konversi ke IDR'),
            ),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}