import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget {
  final TextEditingController control;
  final String hintText;
  final Function onChange;

  MyTextField ({
    this.hintText,
    this.control,
    @required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: control,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: hintText ?? "",
      ),
      onChanged: (value) {
        onChange(value);
      },
    );
  }
}