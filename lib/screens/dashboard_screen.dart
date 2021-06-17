import 'package:flutter/material.dart';
import 'package:parfum_uas/pages/navigation.dart';
import 'package:parfum_uas/screens/add_screen.dart';
import 'package:parfum_uas/widgets/item_list.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  //final FocusNode _nameFocusNode = FocusNode();
  //final FocusNode _emailFocusNode = FocusNode();
  //final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      drawer: NavigationWidget(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red[400],
        title: Text("Custom"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        backgroundColor: Colors.red[400],
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: ItemList(),
        ),
      ),
    );
  }
}
