import 'package:flutter/material.dart';

singleLineDetail({String title, String price}) {
  return Row(
    children: [
      Container(
        width: 150,
        child: Text(title, style: TextStyle(fontSize: 13,), overflow: TextOverflow.clip,)
        ),
      Spacer(),
      Text(price),
    ],
  );
}