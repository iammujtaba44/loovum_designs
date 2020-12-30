import 'package:flutter/material.dart';
import 'package:loovum_designs/ui/screens/blog/blog_1_screen.dart';
import 'package:loovum_designs/ui/screens/blog/blog_screen.dart';
import 'package:loovum_designs/ui/screens/home/home_live_product_page%20copy.dart';
import 'package:loovum_designs/ui/screens/review_purchases_screen.dart';
import 'package:loovum_designs/ui/screens/sign_in_screen.dart';
import 'package:loovum_designs/ui/screens/sign_up_screen.dart';
import 'package:loovum_designs/ui/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Loovum',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
        );
  }
}
