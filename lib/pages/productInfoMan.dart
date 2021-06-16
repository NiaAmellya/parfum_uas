import 'package:flutter/material.dart';
import 'package:parfum_uas/pages/navigation.dart';

class ProductInfoMan extends StatefulWidget {
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfoMan> {
  @override
  Widget build(BuildContext context) {
    final Map<String, Object> rcvdData =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.red[200],
      drawer: NavigationWidget(),
      appBar: AppBar(
        title: Text(' '),
        backgroundColor: Colors.red[400],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                '${rcvdData['name']}',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Center(
              child: Hero(
                tag: '${rcvdData['img']}',
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('img/${rcvdData['img']}.jpg'),
                          fit: BoxFit.contain)),
                ),
              ),
            ),
            Container(
              color: Colors.red[300].withOpacity(0.2),
              padding: EdgeInsets.only(left: 25, top: 20),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      '\$${rcvdData['price']}',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    child: Text(
                      ' /${rcvdData['quantity']}',
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
              child: Container(
                color: Colors.red[300].withOpacity(0.2),
                padding: EdgeInsets.all(25),
                child: Text(
                  '${rcvdData['detail']}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.only(left: 25, right: 25),
              alignment: Alignment.bottomCenter,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[],
              ),
            )
          ],
        ),
      ),
    );
  }
}
