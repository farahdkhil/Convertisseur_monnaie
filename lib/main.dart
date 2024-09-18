import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConversionHome(),
    );
  }
}

class ConversionHome extends StatefulWidget {
  @override
  _ConversionHomeState createState() => _ConversionHomeState();
}

class _ConversionHomeState extends State<ConversionHome> {
  String? selectedValue;
  TextEditingController amountController = TextEditingController();
  double result = 0.0;

  _convertir() {
    double amount = double.tryParse(amountController.text) ?? 0.0;
    if (selectedValue == 'Euro --> DT') {
      result = amount * 3.4;
    } else if (selectedValue == 'DT --> Euro') {
      result = amount / 3;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TP1 APP'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Montant',
              ),
            ),
            SizedBox(height: 15),
            Column(
              children: <Widget>[
                RadioListTile<String>(
                  title: Text('Euro --> DT'),
                  value: 'Euro --> DT',
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
                SizedBox(height: 5),
                RadioListTile<String>(
                  title: Text('DT --> Euro'),
                  value: 'DT --> Euro',
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              'Résultat : $result',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: _convertir,
              child: Text('Convertir'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
