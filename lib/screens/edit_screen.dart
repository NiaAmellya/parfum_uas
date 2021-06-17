import 'package:flutter/material.dart';
import 'package:parfum_uas/utils/database.dart';
import 'package:parfum_uas/widgets/app_bar_title.dart';
import 'package:parfum_uas/widgets/edit_item_form.dart';

class EditScreen extends StatefulWidget {
  final String currentNama;
  final String currentJenis;
  final String currentUkuran;
  final String currentAroma;
  final String currentPackaging;
  final String documentId;

  EditScreen({
    this.currentNama,
    this.currentJenis,
    this.currentUkuran,
    this.currentAroma,
    this.currentPackaging,
    this.documentId,
  });

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final FocusNode _namaFocusNode = FocusNode();
  final FocusNode _jenisFocusNode = FocusNode();
  final FocusNode _ukuranFocusNode = FocusNode();
  final FocusNode _aromaFocusNode = FocusNode();
  final FocusNode _packagingFocusNode = FocusNode();

  bool _isDeleting = false;

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
        backgroundColor: Colors.red[50],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red[400],
          title: AppBarTitle(),
          actions: [
            _isDeleting
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.redAccent,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 32,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });

                      await Database.deleteItem(
                        docId: widget.documentId,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).pop();
                    },
                  ),
          ],
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
                child: EditItemForm(
                  documentId: widget.documentId,
                  namaFocusNode: _namaFocusNode,
                  jenisFocusNode: _jenisFocusNode,
                  ukuranFocusNode: _ukuranFocusNode,
                  aromaFocusNode: _aromaFocusNode,
                  packagingFocusNode: _packagingFocusNode,
                  currentNama: widget.currentNama,
                  currentJenis: widget.currentJenis,
                  currentUkuran: widget.currentUkuran,
                  currentAroma: widget.currentAroma,
                  currentPackaging: widget.currentPackaging,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
