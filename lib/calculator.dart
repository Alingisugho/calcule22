import 'package:flutter/material.dart';

class Calculatrice extends StatefulWidget {
  @override
  _CalculatriceState createState() => _CalculatriceState();
}

class _CalculatriceState extends State<Calculatrice> {
  String resultat = '';
  final controllerNombre1 = TextEditingController();
  final controllerNombre2 = TextEditingController();
  String operationCourante = '+';

  void calculer() {
    double nombre1 = double.parse(controllerNombre1.text);
    double nombre2 = double.parse(controllerNombre2.text);
    double res = 0; // Initialisation de res avec une valeur par défaut de 0
    bool isError = false;

    try {
      switch (operationCourante) {
        case '+':
          res = nombre1 + nombre2;
          break;
        case '-':
          res = nombre1 - nombre2;
          break;
        case 'x':
          res = nombre1 * nombre2;
          break;
        case '/':
          if (nombre2 == 0) {
            isError = true;
            resultat = 'Erreur: Division par zéro';
          } else {
            res = nombre1 / nombre2;
          }
          break;
        default:
          isError = true;
          resultat = 'Opération non reconnue';
          break;
      }
      if (!isError) {
        resultat = res.toString();
      }
    } catch (e) {
      isError = true;
      resultat = 'Erreur: Format de nombre invalide';
    }

    setState(() {
      if (!isError) {
        resultat = res.toStringAsFixed(2); // Pour limiter à deux décimales
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculatrice'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: controllerNombre1,
              decoration: InputDecoration(
                labelText: 'Nombre 1',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controllerNombre2,
              decoration: InputDecoration(
                labelText: 'Nombre 2',
              ),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(
              value: operationCourante,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    operationCourante = newValue;
                  });
                }
              },
              items: <String>['+', '-', 'x', '/']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: calculer,
              child: Text('Calculer'),
            ),
            Text(
              'Résultat: $resultat',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
