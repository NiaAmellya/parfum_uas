import 'package:flutter/material.dart';
import 'package:parfum_uas/utils/database.dart';
import 'package:parfum_uas/utils/validator.dart';
import 'custom_form_field.dart';

class AddItemForm extends StatefulWidget {
  final FocusNode namaFocusNode;
  final FocusNode jenisFocusNode;
  final FocusNode ukuranFocusNode;
  final FocusNode aromaFocusNode;
  final FocusNode packagingFocusNode;

  const AddItemForm({
    this.namaFocusNode,
    this.jenisFocusNode,
    this.ukuranFocusNode,
    this.aromaFocusNode,
    this.packagingFocusNode,
  });

  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _jenisController = TextEditingController();
  final TextEditingController _ukuranController = TextEditingController();
  final TextEditingController _aromaController = TextEditingController();
  final TextEditingController _packagingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 4.0,
              right: 4.0,
              bottom: 15.0,
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
                  maxLines: 2,
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
                  maxLines: 2,
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
                //new Icon(Icons.),
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
                  maxLines: 2,
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

                      if (_addItemFormKey.currentState.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.addItem(
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
                      padding: EdgeInsets.only(top: 12.0, bottom: 10.0),
                      child: Text(
                        'ADD ITEM',
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
