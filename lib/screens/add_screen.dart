import 'package:flutter/material.dart';
//import 'package:parfum_uas/res/custom_colors.dart';
import 'package:parfum_uas/widgets/add_item_form.dart';
//import 'package:parfum_uas/widgets/app_bar_title.dart';

class AddScreen extends StatelessWidget {
  final FocusNode _namaFocusNode = FocusNode();
  final FocusNode _jenisFocusNode = FocusNode();
  final FocusNode _ukuranFocusNode = FocusNode();
  final FocusNode _aromaFocusNode = FocusNode();
  final FocusNode _packagingFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _namaFocusNode.unfocus();
        _jenisFocusNode.unfocus();
        _ukuranFocusNode.unfocus();
        _aromaFocusNode.unfocus();
        _packagingFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.red[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red[400],
          title: Text("Add Item"),
        ),
        body: ListView(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 20.0,
                ),
                child: AddItemForm(
                  namaFocusNode: _namaFocusNode,
                  jenisFocusNode: _jenisFocusNode,
                  ukuranFocusNode: _ukuranFocusNode,
                  aromaFocusNode: _aromaFocusNode,
                  packagingFocusNode: _packagingFocusNode,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
