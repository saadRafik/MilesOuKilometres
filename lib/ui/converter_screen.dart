import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../utils/conversion_logic.dart';

class ConvertisseurScreen extends StatefulWidget {
  @override
  _ConvertisseurScreenState createState() => _ConvertisseurScreenState();
}

class _ConvertisseurScreenState extends State<ConvertisseurScreen> {
  double _nombreSaisi = 0.0;
  String _uniteDepart = mesuresMap.keys.first;
  String _uniteArrivee = mesuresMap.keys.elementAt(1);
  String _message = '';

  final List<String> _unitesMesures = mesuresMap.keys.toList();

  late BannerAd _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();

    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111', // ID de test officiel fourni par Google
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }

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
    final styleTitre = TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue[800]);
    final styleLabel = TextStyle(fontSize: 18, color: Colors.grey[700]);

    return Scaffold(
      appBar: AppBar(
        title: Text('Convertisseur de Mesures'),
        backgroundColor: Colors.blue[600],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Valeur à convertir', style: styleTitre),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      hintText: 'Ex: 42.5',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _nombreSaisi = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                  SizedBox(height: 24),
                  Text('Depuis', style: styleLabel),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: _uniteDepart,
                    onChanged: (newValue) => setState(() => _uniteDepart = newValue!),
                    items: _unitesMesures.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  Text('Vers', style: styleLabel),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: _uniteArrivee,
                    onChanged: (newValue) => setState(() => _uniteArrivee = newValue!),
                    items: _unitesMesures.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: convertir,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[700],
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text('Convertir', style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 24),
                  if (_message.isNotEmpty)
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blueGrey.shade100),
                      ),
                      child: Text(
                        _message,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (_isAdLoaded)
            Container(
              height: _bannerAd.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
        ],
      ),
    );
  }
}
