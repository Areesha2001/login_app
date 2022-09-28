import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function onPress;
  const TextButtonWidget(
      {Key? key, required this.buttonText, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 30, left: 30),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(20)),
        child: TextButton(onPressed: onPress(), child: Text(buttonText, style: TextStyle(color: Colors.white),)));
  }
}
