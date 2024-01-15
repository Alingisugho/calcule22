import 'package:flutter/material.dart';

class CalculMoyenneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calcul Moyenne',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculMoyenne(),
    );
  }
}

class CalculMoyenne extends StatefulWidget {
  @override
  _CalculMoyenneState createState() => _CalculMoyenneState();
}

class _CalculMoyenneState extends State<CalculMoyenne> {
  final controllerMath = TextEditingController();
  final controllerFrancais = TextEditingController();
  final controllerAnglais = TextEditingController();
  final controllerAlgorithme = TextEditingController();
  final controllerNom = TextEditingController();
  final controllerClasse = TextEditingController();
  String mention = '';
  String messageFinal = '';

  void calculerMoyenne() {
    double math = double.tryParse(controllerMath.text) ?? 0;
    double francais = double.tryParse(controllerFrancais.text) ?? 0;
    double anglais = double.tryParse(controllerAnglais.text) ?? 0;
    double algorithme = double.tryParse(controllerAlgorithme.text) ?? 0;

    double totalPoints = math + francais + anglais + algorithme;
    double totalPonderation = 50 + 60 + 40 + 50;
    double pourcentage = (totalPoints / totalPonderation) * 100;

    if (pourcentage < 50) {
      mention = 'A';
    } else if (pourcentage >= 50 && pourcentage < 70) {
      mention = 'S';
    } else if (pourcentage >= 70 && pourcentage < 80) {
      mention = 'D';
    } else if (pourcentage >= 80 && pourcentage < 90) {
      mention = 'GD';
    } else if (pourcentage >= 90 && pourcentage <= 100) {
      mention = 'TGD';
    } else {
      mention = 'Invalide';
    }

    setState(() {
      messageFinal =
          'Bonjour ${controllerNom.text}, vous avez obtenu ${pourcentage.toStringAsFixed(2)}% et votre mention est $mention.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcul de la moyenne'),
        backgroundColor: Colors.black26,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: controllerNom,
                decoration: InputDecoration(
                  labelText: 'Nom',
                ),
              ),
              TextField(
                controller: controllerClasse,
                decoration: InputDecoration(
                  labelText: 'Classe',
                ),
              ),
              TextField(
                controller: controllerMath,
                decoration: InputDecoration(
                  labelText: 'Math /50',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: controllerFrancais,
                decoration: InputDecoration(
                  labelText: 'Français /60',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: controllerAnglais,
                decoration: InputDecoration(
                  labelText: 'Anglais /40',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: controllerAlgorithme,
                decoration: InputDecoration(
                  labelText: 'Algorithme /50',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: calculerMoyenne,
                child: Text('Calculer la Moyenne'),
              ),
              Text(
                messageFinal,
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
