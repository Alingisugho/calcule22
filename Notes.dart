import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  TextEditingController txtname = new TextEditingController();
  TextEditingController txtclass = new TextEditingController();

  TextEditingController txt1 = new TextEditingController();
  TextEditingController txt2 = new TextEditingController();
  TextEditingController txt3 = new TextEditingController();
  TextEditingController txt4 = new TextEditingController();
  TextEditingController txtpercent = new TextEditingController();
  TextEditingController txtmention = new TextEditingController();

  int maxnotes = 200;
  double percent = 0;
  String mention = '';
  void caculateNote() {
    double n1 = double.parse(txt1.text);
    double n2 = double.parse(txt2.text);
    double n3 = double.parse(txt3.text);
    double n4 = double.parse(txt4.text);

    List<double> ls = [n1, n2, n3, n4];
    double somme = n1 + n2 + n3 + n4;
    if (n1 > 0 && n1 <= 50) {
      if (n2 > 0 && n2 <= 60) {
        if (n3 > 0 && n3 <= 40) {
          if (n4 > 0 && n4 <= 50) {
            percent = somme * 100 / 200;
            txtpercent.text = percent.toString();
          }
        }
      }
    } else {
      print("verify entered number if is > the max or if isn't <0");
    }

    analyseMention();
  }

  void analyseMention() {
    if (percent < 50) {
      txtmention.text = 'A';
    }
    if (percent >= 50 && percent < 70) {
      txtmention.text = 'S';
    }
    if (percent >= 70 && percent < 80) {
      txtmention.text = 'D';
    }
    if (percent >= 80 && percent < 100) {
      txtmention.text = 'D';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Nom:'),
                TextFormField(
                    controller: txtname,
                    decoration: InputDecoration(
                      labelText: "nom",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Classe :'),
                TextFormField(
                    controller: txtclass,
                    decoration: InputDecoration(
                      labelText: "Class",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('MATH /50 '),
                TextFormField(
                    controller: txt1,
                    decoration: InputDecoration(
                      labelText: "notes",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('FRANCAIS /60 '),
                TextFormField(
                    controller: txt2,
                    decoration: InputDecoration(
                      labelText: "notes",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('ANGLAIS /40 '),
                TextFormField(
                    controller: txt3,
                    decoration: InputDecoration(
                      labelText: "notes",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('ALGORITHMIQUES /50 '),
                TextFormField(
                    controller: txt4,
                    decoration: InputDecoration(
                      labelText: "notes",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: TextButton(
                  onPressed: () {
                    caculateNote();
                  },
                  child: Text('CALCULER'))),
          Center(child: Text('Bonjour ${txtname.text} vous avez ${percent} %')),
          Center(child: Text('Et la mention ${mention}')),
        ],
      ),
    );
  }
}
