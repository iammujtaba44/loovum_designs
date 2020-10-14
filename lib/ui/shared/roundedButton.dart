import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

RoundedButton(double width, double height, String _label, double borderWidth,TextStyle _style) {
  
  return Container(
    height: height,
    width: width,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border.all(
          width: borderWidth,
          color: Colors.black //                   <--- border width here
          ),
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Text(_label,
          style: _style),
    ),
  );
}
