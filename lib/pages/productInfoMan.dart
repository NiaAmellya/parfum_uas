import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parfum_uas/pages/man.dart';
import 'package:parfum_uas/pages/navigation.dart';

class ProductInfoMan extends StatefulWidget {
  ProductInfoMan({this.document});
  QueryDocumentSnapshot document;
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfoMan> {
  @override
  Widget build(BuildContext context) {
    final Map<String, Object> rcvdData =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavigationWidget(),
      appBar: AppBar(
        title: Text(' '),
        backgroundColor: Colors.red[400],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                widget.document['nama'],
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          widget.document['gambar'],
                        ),
                        fit: BoxFit.contain)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.red[300].withOpacity(0.2),
              padding: EdgeInsets.only(left: 25, top: 20),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      widget.document['harga'],
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.document['ukuran'],
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    color: Colors.red[300].withOpacity(0.2),
                    padding: EdgeInsets.all(25),
                    child: Text(
                      "Parfum adalah campuran minyak esensial dan senyawa aroma, fiksatif, dan pelarut yang digunakan untuk memberikan bau wangi untuk tubuh manusia, objek, atau ruangan. Ada Berbagai macam ekstrak, yaitu parfum, Eau de parfum, Eau de toilette, atau Eau de Cologne.",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.only(left: 25, right: 25),
              alignment: Alignment.bottomCenter,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
            )
          ],
        ),
      ),
    );
  }
}
