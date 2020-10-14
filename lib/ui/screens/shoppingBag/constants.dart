





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


 _bottomNavigationBar(Function onPageChanged, int pageIndex){


   return CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/home_black.png'), )),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt)),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active)),
          BottomNavigationBarItem(icon: Icon(Icons.person)),
        ],
        currentIndex: pageIndex,
        activeColor: Colors.black,
        inactiveColor: Color(0xFFC3C1C1),
        backgroundColor: Colors.white,
        onTap: onPageChanged,
      );
 } 