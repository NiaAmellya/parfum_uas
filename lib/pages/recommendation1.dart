import 'package:parfum_uas/pages/home.dart';
import 'package:parfum_uas/pages/woman.dart';
import 'package:parfum_uas/pages/man.dart';
import 'package:flutter/material.dart';

class Recommendation1 extends StatefulWidget {
  @override
  Recommendation1State createState() => Recommendation1State();
}

class Recommendation1State extends State<Recommendation1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Catalog'),
          backgroundColor: Colors.red[400],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
        ),
        backgroundColor: Colors.red[200],
        body: Column(children: [
          //   Container(
          //     child: Column(
          //       children: <Widget>[
          //         // Foto utama
          //         new Image.asset('img/woman.jpeg'),
          //       ],
          //     ),
          //   ),
          //button recomendation
          Container(
            height: 300,
            width: 425,
            margin: EdgeInsets.all(10),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Color.fromRGBO(0, 0, 0, 1))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Foto utama
                  new Image.asset('img/woman.jpeg'),
                  Text("WOMAN",
                      style: TextStyle(
                          fontSize: 27, color: Color.fromRGBO(0, 0, 0, 1))),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Woman()),
                );
              },
            ),
          ),
          //button custome
          Container(
            child: Column(
                // children: <Widget>[
                //   // Foto utama
                //   new Image.asset('img/man.jpeg'),
                // ],
                ),
          ),
          //button recomendation
          Container(
            height: 300,
            width: 425,
            margin: EdgeInsets.all(10),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Color.fromRGBO(0, 0, 0, 1))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Foto utama
                  new Image.asset('img/man.jpeg'),
                  Text("MAN",
                      style: TextStyle(
                          fontSize: 27, color: Color.fromRGBO(0, 0, 0, 1))),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Man()),
                );
              },
            ),
          ),
        ]));
  }
}
