import 'package:parfum_uas/pages/productInfoMan.dart';
import 'package:parfum_uas/pages/productInfoWoman.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parfum_uas/pages/recommendation1.dart';

void main() {
  runApp(Woman());
}

class Woman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      routes: {
        '/productInfoWoman': (context) => ProductInfoWoman(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        title: Text(' '),
        backgroundColor: Colors.red[400],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Recommendation1()),
            );
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(6, createItem),
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
          childAspectRatio: 0.7,
        ),
      ),
    );
  }

  Container createItem(int id) {
    List<String> itemNames = [
      'Versace',
      'Chanel',
      'Gucci',
      'Lancome',
      'Louis Vuitton',
      'Marc Jacobs'
    ];
    List<double> itemPrice = [53.88, 159.91, 100.82, 125.01, 316.29, 53.88];
    List<String> itemQuantity = [
      '90 mL',
      '100 mL',
      '100 mL',
      '75 mL',
      '100 mL',
      '125 mL'
    ];
    var newNum = id + 1;
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: InkWell(
          onTap: () {
            openProductInfo(newNum, itemPrice[id].toString(),
                itemNames[id].toString(), itemQuantity[id].toString());
          },
          child: Column(
            children: <Widget>[
              Hero(
                tag: 'img$newNum',
                child: Container(
                  height: 90,
                  child: Image.asset('img/img$newNum.jpg'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  '\$' + itemPrice[id].toString(),
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                child: Text(
                  itemNames[id],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                child: Text(
                  itemQuantity[id],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                height: 0.5,
                color: Colors.grey,
              ),
              SizedBox(
                height: 7,
              ),
            ],
          )),
    );
  }

  void openProductInfo(int id, String price, String name, String quantity) {
    Navigator.pushNamed(context, '/productInfoWoman', arguments: {
      'img': 'img$id',
      'name': name,
      'quantity': quantity,
      'price': price
    });
  }
}
