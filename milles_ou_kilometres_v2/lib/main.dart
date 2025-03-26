import 'package:flutter/material.dart';
import 'ui/converter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Convertisseur de Mesures',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ConvertisseurScreen(),
    );
  }
}
