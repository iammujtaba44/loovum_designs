import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/shared/widgets/appBar.dart';
import 'package:loovum_designs/ui/shared/widgets/store_rating.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';

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
      home: Scaffold(body: Center(child: StoreAboutPage())),
    );
  }
}

class StoreAboutPage extends StatefulWidget {
  @override
  _StoreAboutPageState createState() => _StoreAboutPageState();
}

class _StoreAboutPageState extends State<StoreAboutPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300.h,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            'A Family Business',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Seller since Nov 15, 2015',
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: .3,
            width: double.infinity,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('About'.toUpperCase()),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consetetur sadispscing elitr, sed diam nonumy eimod tempor invidunt ut labore et dolore.',
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _reviewsWidget() {
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Samuel Smith'),
                SmoothStarRating(
                  rating: 3,
                  isReadOnly: false,
                  size: 20,
                  color: Colors.yellow,
                  borderColor: Colors.yellow,
                  filledIconData: Icons.star,
                  halfFilledIconData: Icons.star_half,
                  defaultIconData: Icons.star_border,
                  starCount: 5,
                  allowHalfRating: true,
                  spacing: 2.0,
                  onRated: (value) {
                    print("rating value -> $value");
                    // print("rating value dd -> ${value.truncate()}");
                  },
                )
              ]),
          trailing: Text(
            '1 hour ago',
            style: TextStyle(fontSize: 10),
          ),
        ),
        ListTile(
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            title: Text(
              'Lorem ipsum dolor sit amet, consetetur sadispscing elitr, sed diam nonumy eimod tempor invidunt ut labore et dolore.',
              style: TextStyle(fontSize: 12),
            ))
      ],
    );
  }

  Padding _item() {
    return Padding(
      padding: EdgeInsets.only(top: 20, right: 25.w, left: 25.w),
      child: Column(
        children: [
          Container(
            height: 500.h,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text('Flexible gym sweat pants | S - XL'),
              Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 18,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text('503')
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.0.w,
              top: 5.h,
            ),
            child: Row(
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
          )
        ],
      ),
    );
  }
}
