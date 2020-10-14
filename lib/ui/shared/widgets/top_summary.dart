
  import 'package:flutter/material.dart';

topShortSummary({String title, String number}) {
    return Column(
      children: [
        Text(number),
        SizedBox(height: 5.0,),
        Text(title),
      ], 
    );
  }