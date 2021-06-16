import 'package:parfum_uas/pages/productInfoMan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Man());
}

class Man extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      routes: {
        '/productInfoMan': (context) => ProductInfoMan(),
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
      'Dior',
      'Louis Vuitton',
      'Prada',
      'Calvin Klein',
      'Chanel',
      'Lancome'
    ];
    List<double> itemPrice = [53.88, 159.91, 100.82, 125.01, 316.29, 53.88];
    List<String> itemQuantity = [
      '100 mL',
      '100 mL',
      '100 mL',
      '200 mL',
      '100 mL',
      '75 mL'
    ];
    var newNum = id + 1;
    var itemDetail = [
      "Dune Pour Homme by Christian Dior is a Woody Floral Musk fragrance for men. Dune Pour Homme was launched in 1997. Dune Pour Homme was created by Olivier Cresp and Jean-Pierre Bethouart. Top notes are Fig Leaf, Cassis, Sage and Basil.",
      "Les Sables Roses by Louis Vuitton is a Amber Floral fragrance for women and men. This is a new fragrance. Les Sables Roses was launched in 2019. The nose behind this fragrance is Jacques Cavallier.",
      "Prada L'Homme by Prada is a Woody Chypre fragrance for men. Prada L'Homme was launched in 2016. The nose behind this fragrance is Daniela (Roche) Andrier. Top notes are Neroli, Black Pepper, Cardamom and Carrot Seeds.",
      "CK One by Calvin Klein is a Citrus Aromatic fragrance for women and men. CK One was launched in 1994. CK One was created by Alberto Morillas and Harry Fremont. Top notes are Lemon, Green Notes, Bergamot, Pineapple, Mandarin Orange, Cardamom and Papaya.",
      "Bleu de Chanel by Chanel is a Woody Aromatic fragrance for men. Bleu de Chanel was launched in 2010. The nose behind this fragrance is Jacques Polge. Top notes are Grapefruit, Lemon, Mint and Pink Pepper.",
      "Hypnôse Homme by Lancome is a Amber Fougere fragrance for men. Hypnôse Homme was launched in 2007. The nose behind this fragrance is Maurice Roucel. Top notes are Cardamom, Mint, Bergamot and Mandarin Orange."
    ];
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: InkWell(
          onTap: () {
            openProductInfo(
                newNum,
                itemPrice[id].toString(),
                itemNames[id].toString(),
                itemQuantity[id].toString(),
                itemDetail[id].toString());
          },
          child: Column(
            children: <Widget>[
              Hero(
                tag: 'cw$newNum',
                child: Container(
                  height: 90,
                  child: Image.asset('img/cw$newNum.jpg'),
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

  void openProductInfo(
      int id, String price, String name, String quantity, String itemDetail) {
    Navigator.pushNamed(context, '/productInfoMan', arguments: {
      'img': 'cw$id',
      'name': name,
      'quantity': quantity,
      'price': price,
      'detail': itemDetail
    });
  }
}
