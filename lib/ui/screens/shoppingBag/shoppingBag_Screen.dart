import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/screens/shoppingBag/paymentMethods_screen.dart';
import 'package:loovum_designs/ui/screens/shoppingBag/shippingAddress_Screen.dart';
import 'package:loovum_designs/ui/shared/widgets/heighRatio.dart';
import 'package:loovum_designs/ui/shared/widgets/pink_button.dart';

import 'package:preview/preview.dart';

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
      home: Scaffold(body: Center(child: ShoppingBagScreen())),
    );
  }
}

class ShoppingBagScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShoppingBagScreenState();
  }
}

class ShoppingBagScreenState extends State<ShoppingBagScreen> {
  List<String> _cities = ['1', '2', '3', '4']; // Option 2
  String _selectedCity;
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    var ScreenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              appBar(
                  height: ScreenSize.height * 0.09,
                  width: ScreenSize.width,
                  title: 'Shopping bag'),
              _listview(context)
            ],
          ),
        ),
      ),
    );
  }

  _listview(BuildContext context) {
    var ScreenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        _container(
            context,
            "Shipping Address",
            "Orkhan Rasulov",
            "409 Summerbrook Dr Atlanta, GA 30350",
            Icon(
              Icons.home,
              size: 30.0,
              color: Colors.grey,
            ), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ShippingAddress()));
        }),
        Divider(
          thickness: 2,
        ),
        _container(
            context,
            "Payment Method",
            "Orkhan Rasulov",
            "409 Summerbrook Dr Atlanta, GA 30350",
            Icon(
              Icons.payment,
              size: 30.0,
              color: Colors.grey,
            ), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PaymentMethod()));
        }),
        Divider(
          thickness: 2,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0.h),
          color: Colors.white10,
          width: MediaQuery.of(context).size.width,
          height: getScreenHeight(context) == 0
              ? ScreenSize.height * 0.27
              : getScreenHeight(context) == 1
                  ? ScreenSize.height * 0.245
                  : ScreenSize.height * 0.225,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Item in Bag",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              height: 80,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.black,
                              ),
                            ),
                            title: Text(
                              'Flexible Gym Pants| Grey',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text('3/24/styles'),
                            onTap: () {},
                          )
                        ]),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(left: 40.0.w, top: 20.0),
                    child: Text('14.51',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ))
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 15.0),
                  width: 70.0,
                  height: 40.0,
                  // alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[400]),
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 20,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        letterSpacing: 1.2,
                      ),
                      iconEnabledColor: Colors.grey,
                      iconDisabledColor: Colors.red,
                      isDense: true,
                      items: _cities.map((city) {
                        return DropdownMenuItem(
                          child: Text(city),
                          value: city,
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCity = newValue;
                        });
                      },
                      value: _selectedCity,
                      isExpanded: false,
                      hint: new Text(
                        "1",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.0.w),
                Container(
                  // padding: EdgeInsets.all(10.0),
                  width: 50.0,
                  height: 40.0,
                  // alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[400]),
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  alignment: Alignment.bottomRight,
                  child: Center(child: Text("X")),
                )
              ])
            ],
          ),
        ),
        Container(
            decoration: DottedDecoration(
                shape: Shape.line, linePosition: LinePosition.bottom)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0.h),
          color: Colors.white10,
          width: MediaQuery.of(context).size.width,
          height: ScreenSize.height * 0.27,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shipping',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 15.0)),
                  Text(
                    '0.00',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sorted by',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 15.0)),
                  Text(
                    'Loovum Clothing',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Estimated to ship by',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 15.0)),
                  Text(
                    'Sat, Sep 05',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text('Loovum clothing usually ships within',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontSize: 15.0))),
                  Text(
                    '3 Business Days',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0.h),
          color: Colors.white10,
          width: MediaQuery.of(context).size.width,
          height: 300.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Order Summaray",
                  style:
                      TextStyle(fontSize: 30.0.w, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Item total',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 15.0)),
                  Text(
                    '14.1',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shipping',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 15.0)),
                  Text(
                    '0.00',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Order total',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 15.0)),
                  Text(
                    '18.25',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 40.0, horizontal: 15.0),
          child: pinkButton(
              height: getScreenHeight(context) == 0
                  ? ScreenSize.height * 0.09
                  : ScreenSize.height * 0.07,
              width: MediaQuery.of(context).size.width,
              title: "Place Order",
              func: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Scaffold(body: Center(child: ShippingAddress()))),
                );
              }),
        ),
        SizedBox(
          height: 10.0,
        ),
        Column(children: [
          Text('Loovum’s Promise.',
              style: TextStyle(fontSize: 30.w, fontWeight: FontWeight.w500)),
          SizedBox(
            height: 10.0,
          ),
          Text(
              'If you are not satisfied with your Loovum order, \n we will make it right and refund your purchase.',
              style: TextStyle(
                  fontSize: 20.w,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey[700])),
          SizedBox(
            height: 10.0,
          ),
          Text('Cross our hearts.',
              style: TextStyle(fontSize: 30.w, fontWeight: FontWeight.w500)),
        ]),
        SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}

_container(BuildContext context, String _primaryname, String _defaultAdd,
    String _secondAdd, Icon _icon, Function _func) {
  var ScreenSize = MediaQuery.of(context).size;
  return Container(
      padding: const EdgeInsets.only(top: 20.0, left: 12.0),
      height: getScreenHeight(context) == 0
          ? ScreenSize.height * 0.18
          : ScreenSize.height * 0.13,
      width: ScreenSize.width,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 12.0),
              child: _icon,
            ),
            Row(
              children: [
                //   _icon,
                Container(
                  margin: EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        _primaryname,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.w,
                        ),
                      ),
                      Wrap(
                        spacing: 10.0,
                        children: [
                          Text(_defaultAdd,
                              style: TextStyle(
                                  color: const Color(0xFFC1B6DF),
                                  fontSize: 20.0.w)),
                          Text(
                            "(Default)",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 20.0.w),
                          )
                        ],
                      ),
                      Text(_secondAdd,
                          style: TextStyle(
                              color: const Color(0xFFC1B6DF), fontSize: 20.0.w))
                    ],
                  ),
                ),
                SizedBox(
                  width: getScreenHeight(context) == 0
                      ? ScreenSize.width * 0.24
                      : getScreenHeight(context) == 1
                          ? ScreenSize.width * 0.25
                          : ScreenSize.width * 0.33,
                ),
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    size: 30.0,
                    color: Colors.grey,
                  ),
                  onPressed: _func,
                ),
              ],
            ),
          ]));
}

class IPhone5 extends PreviewProvider {
  @override
  String get title => 'iPhone 5';
  @override
  List<Preview> get previews => [
        Preview(
          key: Key('preview'),
          frame: Frames.iphone5,
          child: MyApp(),
        ),
      ];
}

class IPhoneX extends PreviewProvider {
  @override
  String get title => 'Iphone X';
  @override
  List<Preview> get previews => [
        Preview(
          frame: Frames.iphoneX,
          child: MyApp(),
        ),
      ];
}
