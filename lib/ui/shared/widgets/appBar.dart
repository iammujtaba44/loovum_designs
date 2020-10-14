import 'package:flutter/material.dart';

appBar(
    {double height,
    double width,
    String title = 'Settings',
    bool isSearchBar = false}) {
  return Container(
    alignment: Alignment.bottomCenter,
    height: height,
    width: width,
    color: Colors.grey[300],
    child: isSearchBar
        ? TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(title),
          ),
  );
}

appBarWithIcon(
    {double height,
    double width,
    String title = 'Settings',
    IconButton iconbtn,
    IconButton trailingIcon}) {
  return Container(
      alignment: Alignment.bottomCenter,
      height: height,
      width: width,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[iconbtn, Text(title), trailingIcon],
      ));
}
