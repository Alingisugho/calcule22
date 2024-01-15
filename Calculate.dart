import 'package:flutter/material.dart';
import 'package:myapp/Notes.dart';

class Calculate extends StatefulWidget {
  const Calculate({Key? key}) : super(key: key);

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  TextEditingController txtn1 = new TextEditingController();
  TextEditingController txtn2 = new TextEditingController();
  TextEditingController txtn3 = new TextEditingController();

  var response = 0;

  void addition() {
    int n1 = int.parse(txtn1.text);
    int n2 = int.parse(txtn2.text);
    response = n1 + n2;
    txtn3.text = response.toString();
  }

  void substract() {
    int n1 = int.parse(txtn1.text);
    int n2 = int.parse(txtn2.text);
    response = n1 - n2;
    txtn3.text = response.toString();
  }

  void divide() {
    int n1 = int.parse(txtn1.text);
    int n2 = int.parse(txtn2.text);
    double res = n1 / n2;
    txtn3.text = res.toString();
  }

  void multiply() {
    int n1 = int.parse(txtn1.text);
    int n2 = int.parse(txtn2.text);
    response = n1 * n2;
    txtn3.text = response.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
        
      ),
      body: Column(
        children: [
          SizedBox(height: 60,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              child: TextFormField(
                  controller: txtn1,
                  decoration: InputDecoration(
                    labelText: "number 1",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),           
                  )),
            ),
          ),
           SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
                decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.red,
              ],
              
            )),
            child: Column(children: [
            TextFormField(
                  controller: txtn2,
                  decoration: InputDecoration(
                    labelText: "number 2",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                   
                  )),
            ],),
            
            ),
          ),
           SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    addition();
                  },
                  icon: Icon(Icons.add),
                  
                  label: Text(
                    'Add',
                    style: TextStyle(fontFamily: 'roboto', fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    substract();
                  },
                  icon: Icon(Icons.exposure_minus_1),
                  label: Text(
                    'Subtract',
                    style: TextStyle(fontFamily: 'roboto', fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    divide();
                  },
                  icon: Icon(Icons.safety_divider),
                  label: Text(
                    'Divide',
                    style: TextStyle(fontFamily: 'roboto', fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
               
                ElevatedButton.icon(
                  onPressed: () {
                    multiply();
                  },
                  
                  icon: Icon(Icons.multiple_stop),
                  label: Text(
                    'Multiply',
                    style: TextStyle(fontFamily: 'roboto', fontSize: 15),
                  ),
                ),
              ],
            )),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
           padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              child: TextFormField(
                  controller: txtn3,
                  decoration: InputDecoration(
                    labelText: "response",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                   
                  )),
            ),
          ),
           SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              child:  TextButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Notes(),
                            ))
                      },
                  child: const Text('click')),
            ),
          ),
        ],
      ),
    );
  }
}
