import 'dart:ffi';

import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final dynamic prefixIcon;
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      controller: controller,
      validator: (value){
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        fillColor: Colors.grey,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        filled: true,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
