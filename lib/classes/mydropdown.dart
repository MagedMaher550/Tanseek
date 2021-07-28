import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyDropDown extends StatelessWidget {
  final List<String> listItems;
  final String hintText;
  final Function onChange;

  MyDropDown({
    @required this.listItems,
    @required this.hintText,
    @required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return  DropdownButton<String>(
        isExpanded: true,
      style: TextStyle(fontSize: 25, color: Colors.black),
      iconSize: 0.0,
      hint: Text(
        hintText,
        style: TextStyle(color: Colors.black),
      ),
      items: listItems.map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      onChanged: (String newValue) {
        onChange(newValue);
      },
    );
  }
}
