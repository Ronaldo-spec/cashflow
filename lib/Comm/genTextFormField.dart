// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class getTextFromField extends StatelessWidget {
  TextEditingController controller;
  String hintName;
  IconData icon;
  bool isObscureText;
  TextInputType inputType = TextInputType.text;

  getTextFromField(
      {required this.controller,
      required this.hintName,
      required this.icon,
      this.isObscureText = false,
      required this.inputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      margin: EdgeInsets.only(top: 20.0),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.00)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          prefixIcon: Icon(icon),
          hintText: hintName,
          fillColor: Colors.grey[350],
          filled: true,
        ),
      ),
    );
  }
}
