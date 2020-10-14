import 'package:flutter/material.dart';

pinkButton({double height, double width, bool isRounded = false, String title = 'Sign Up', Function func}) {
  return SizedBox(
    height: height,
    width: width,
    child: RaisedButton(
      shape: isRounded
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),)
          : null,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      color: Color(0xFFE6798A),
      onPressed: func,
    ),
  );
}
