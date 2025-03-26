final Map<String, int> mesuresMap = {
  'mètres': 0, 'kilomètres': 1, 'grammes': 2, 'kilogrammes': 3,
  'pieds': 4, 'miles': 5, 'livres': 6, 'onces': 7
};

final List<List<double>> formules = [
  [1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0],  // mètres
  [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0],      // kilomètres
  [0, 0, 1, 0.001, 0, 0, 0.00220462, 0.035274],  // grammes
  [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],        // kilogrammes
  [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0], // pieds
  [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],       // miles
  [0, 0, 453.592, 0.453592, 0, 0, 1, 16],        // livres
  [0, 0, 28.3495, 0.0283495, 0, 0, 0.0625, 1]    // onces
];

double convertirValeur(double valeur, String depuis, String vers) {
  int numDepuis = mesuresMap[depuis]!;
  int numVers = mesuresMap[vers]!;

  double multiplicateur = formules[numDepuis][numVers];
  return valeur * multiplicateur;
}