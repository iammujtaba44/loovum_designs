import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/screens/home/home_expired_product_page.dart';
import 'package:loovum_designs/ui/shared/widgets/appBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(body: Center(child: Favourites_2())),
    );
  }
}

class Favourites_2 extends StatefulWidget {
  @override
  _Favourites_2State createState() => _Favourites_2State();
}

class _Favourites_2State extends State<Favourites_2> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 18.0,
                right: 18.0,
                top: 15.0,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      // width: 100,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      // height: 25,
                      decoration: BoxDecoration(
                          color: const Color(0xFFE6798A)
                              .withOpacity(0.8), //Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      child: Text('Sneak Peeks',
                          style: TextStyle(color: Colors.white)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      // width: 100,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      // height: 25,
                      decoration: BoxDecoration(
                          color: Colors
                              .white, //const Color(0xFFE6798A) .withOpacity(0.8), //Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      child: Text('Live', style: TextStyle(color: Colors.grey)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      // width: 100,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      // height: 25,
                      decoration: BoxDecoration(
                          color: Colors
                              .white, //const Color(0xFFE6798A) .withOpacity(0.8), //Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      child:
                          Text('History', style: TextStyle(color: Colors.grey)),
                    ),
                  ]),
            ),
            _item(),
            _item(),
          ],
        ),
      ),
    );
  }

  _containerIner() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          Row(
            children: [
              Text('Flexible gym sweat pants | S - XL'),
              Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 19,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '503',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '\$14.51',
                style: TextStyle(color: Color(0xFFE6798A), fontSize: 13),
              ),
              SizedBox(
                width: 20.w,
              ),
              Row(
                children: [
                  Text(
                    '\$8.23',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough, fontSize: 12),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 2, bottom: 2),
                      child: Text(
                        'FREE SHIPPING',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding _item() {
    var ScreenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 35, right: 18, left: 18),
      child: Column(
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: ScreenSize.height * 0.57,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 25,
                  decoration: BoxDecoration(
                      color: const Color(0xFFE6798A)
                          .withOpacity(0.8), //Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Text('00 : 05 : 17 ',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Text(
                'Flexible gym sweat pants | S - XL',
                style: TextStyle(fontSize: 15.0),
              ),
              Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 19,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '503',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.0.w,
              top: 15.h,
            ),
            child: Row(
              children: [
                Text(
                  '\$14.51',
                  style: TextStyle(color: Color(0xFFE6798A), fontSize: 15.0),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Row(
                  children: [
                    Text(
                      '\$8.23',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 13.0),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 2, bottom: 2),
                        child: Text(
                          'FREE SHIPPING',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
