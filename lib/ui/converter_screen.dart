import 'package:flutter/material.dart';
import '../utils/conversion_logic.dart';

class ConvertisseurScreen extends StatefulWidget {
  @override
  _ConvertisseurScreenState createState() => _ConvertisseurScreenState();
}

class _ConvertisseurScreenState extends State<ConvertisseurScreen> {
  double _nombreSaisi = 0.0;
  String _uniteDepart = 'mètres';
  String _uniteArrivee = 'kilomètres';
  String _message = '';

  final List<String> _unitesMesures = mesuresMap.keys.toList();

  void convertir() {
    if (_uniteDepart == _uniteArrivee) {
      setState(() {
        _message = "Les unités doivent être différentes ! 🚨";
      });
      return;
    }

    double resultat = convertirValeur(_nombreSaisi, _uniteDepart, _uniteArrivee);

    setState(() {
      _message = (resultat == 0)
          ? 'Conversion impossible 🚫'
          : '$_nombreSaisi $_uniteDepart = ${resultat.toStringAsFixed(4)} $_uniteArrivee';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Convertisseur de Mesures')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Valeur à convertir', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(hintText: 'Entrez une valeur'),
              onChanged: (value) {
                setState(() {
                  _nombreSaisi = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Depuis', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: _uniteDepart,
              onChanged: (newValue) {
                setState(() {
                  _uniteDepart = newValue!;
                });
              },
              items: _unitesMesures.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Text('Vers', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: _uniteArrivee,
              onChanged: (newValue) {
                setState(() {
                  _uniteArrivee = newValue!;
                });
              },
              items: _unitesMesures.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertir,
              child: Text('Convertir'),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
