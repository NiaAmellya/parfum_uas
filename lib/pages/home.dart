import 'package:parfum_uas/pages/navigation.dart';
import 'package:parfum_uas/pages/recommendation1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:parfum_uas/screens/dashboard_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //membuat widget dan menjalankan program
    Widget image_slider_carousel = Container(
      //slider pada dihalaman awal
      height: 400,
      //width: 200,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          //gambar yang telah tersimpan di folder
          AssetImage('img/pic1.jpeg'),
          AssetImage('img/pic2.jpeg'),
          AssetImage('img/pic3.jpeg'),
          AssetImage('img/pic4.jpeg'),
          AssetImage('img/pic5.jpeg'),
          AssetImage('img/pic6.jpeg'),
          AssetImage('img/pic7.jpeg'),
          AssetImage('img/pic8.jpeg'),
          AssetImage('img/pic9.jpeg'),
        ],
        autoplay: true, // Slider berjalan sesuai dengan waktu yang ditentukan
        indicatorBgPadding: 1.0,
        dotBgColor: Colors.red[300],
        dotColor: Colors.white,
        dotSize: 4.0,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.red[200],
      drawer: NavigationWidget(),
      appBar: AppBar(
        title: Text('Parfume'),
        backgroundColor: Colors.red[400],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            image_slider_carousel,
            //button recomendation
            Container(
              height: 50,
              width: 250,
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 1),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Recommendation",
                        style: TextStyle(
                            fontSize: 27, color: Color.fromRGBO(0, 0, 0, 1))),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Recommendation1()),
                  );
                },
              ),
            ),
            //button custome
            Container(
              height: 50,
              width: 250,
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color.fromRGBO(0, 0, 0, 1))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Custome",
                        style: TextStyle(
                            fontSize: 27, color: Color.fromRGBO(0, 0, 0, 1))),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
