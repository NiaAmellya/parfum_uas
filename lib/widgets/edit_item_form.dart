import 'package:flutter/material.dart';
import 'package:parfum_uas/utils/database.dart';
import 'package:parfum_uas/utils/validator.dart';
import 'custom_form_field.dart';

class EditItemForm extends StatefulWidget {
  final FocusNode namaFocusNode;
  final FocusNode jenisFocusNode;
  final FocusNode ukuranFocusNode;
  final FocusNode aromaFocusNode;
  final FocusNode packagingFocusNode;
  final String currentNama;
  final String currentJenis;
  final String currentUkuran;
  final String currentAroma;
  final String currentPackaging;
  final String documentId;

  const EditItemForm({
    this.namaFocusNode,
    this.jenisFocusNode,
    this.ukuranFocusNode,
    this.aromaFocusNode,
    this.packagingFocusNode,
    this.currentNama,
    this.currentJenis,
    this.currentUkuran,
    this.currentAroma,
    this.currentPackaging,
    this.documentId,
  });

  @override
  _EditItemFormState createState() => _EditItemFormState();
}

class _EditItemFormState extends State<EditItemForm> {
  final _editItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  TextEditingController _namaController;
  TextEditingController _jenisController;
  TextEditingController _ukuranController;
  TextEditingController _aromaController;
  TextEditingController _packagingController;

  @override
  void initState() {
    _namaController = TextEditingController(
      text: widget.currentNama,
    );

    _jenisController = TextEditingController(
      text: widget.currentJenis,
    );
    _ukuranController = TextEditingController(
      text: widget.currentUkuran,
    );

    _aromaController = TextEditingController(
      text: widget.currentAroma,
    );
    _packagingController = TextEditingController(
      text: widget.currentPackaging,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _editItemFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 4.0,
              right: 4.0,
              bottom: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.0),
                Text(
                  'Nama Customer',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _namaController,
                  focusNode: widget.namaFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Nama Customer',
                  hint: 'Enter your note name',
                ),
                SizedBox(height: 15.0),
                Text(
                  'Jenis',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3.0),
                CustomFormField(
                  maxLines: 1,
                  isLabelEnabled: false,
                  controller: _jenisController,
                  focusNode: widget.jenisFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Jenis',
                  hint: 'Enter your note jenis',
                ),
                SizedBox(height: 15.0),
                Text(
                  'Ukuran',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3.0),
                CustomFormField(
                  maxLines: 1,
                  isLabelEnabled: false,
                  controller: _ukuranController,
                  focusNode: widget.ukuranFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Ukuran',
                  hint: 'Enter your note ukuran',
                ),
                SizedBox(height: 15.0),
                Text(
                  'Aroma',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3.0),
                CustomFormField(
                  maxLines: 1,
                  isLabelEnabled: false,
                  controller: _aromaController,
                  focusNode: widget.aromaFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Aroma',
                  hint: 'Enter your note aroma',
                ),
                SizedBox(height: 15.0),
                Text(
                  'Packaging',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3.0),
                CustomFormField(
                  maxLines: 1,
                  isLabelEnabled: false,
                  controller: _packagingController,
                  focusNode: widget.packagingFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Packaging',
                  hint: 'Enter your note packaging',
                ),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.red[400],
                    ),
                  ),
                )
              : Container(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.red[400],
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      widget.namaFocusNode.unfocus();
                      widget.jenisFocusNode.unfocus();
                      widget.ukuranFocusNode.unfocus();
                      widget.aromaFocusNode.unfocus();
                      widget.packagingFocusNode.unfocus();

                      if (_editItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.updateItem(
                          docId: widget.documentId,
                          nama: _namaController.text,
                          jenis: _jenisController.text,
                          ukuran: _ukuranController.text,
                          aroma: _aromaController.text,
                          packaging: _packagingController.text,
                        );

                        setState(() {
                          _isProcessing = false;
                        });

                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 17.0, bottom: 20.0),
                      child: Text(
                        'UPDATE ITEM',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
