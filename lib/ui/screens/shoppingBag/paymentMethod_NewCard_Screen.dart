import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/screens/shoppingBag/addShippingAddresss_screen.dart';
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
      home: Scaffold(body: Center(child: PaymentMethodAddCard())),
    );
  }
}

class PaymentMethodAddCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PaymentMethodAddCardState();
  }
}

class PaymentMethodAddCardState extends State<PaymentMethodAddCard> {
  final _form = GlobalKey<FormState>();

  bool _setAsDefault = false;

  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    var ScreenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Form(
        key: _form,
        child: Container(
          color: Colors.white,
          //  height: ScreenSize.height,
          // width: ScreenSize.width,
          child: Column(
            children: [
              appBar(height: 120.h, width: 750.w, title: '<Card holder name>'),
              SizedBox(height: 20.h),
              Flexible(
                child: ListView(children: [
                  Container(
                      margin: EdgeInsets.all(10.0),
                      child: Column(children: [
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Name on card'),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Field is Empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 50.0.h,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Card Number'),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Field is Empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 50.0.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'Expiry date'),
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Field is Empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(labelText: 'CVV'),
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Field is Empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Scaffold(
                                      body:
                                          Center(child: AddShippingAddress()))),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Set As Default card',
                                  style: TextStyle(
                                      fontSize: 30.0.w,
                                      fontWeight: FontWeight.w700)),
                              CupertinoSwitch(
                                onChanged: (value) {
                                  setState(() {
                                    _setAsDefault = value;
                                  });
                                },
                                activeColor: Colors.pink,
                                value: _setAsDefault,
                              )
                            ],
                          ),
                        ),
                      ]))
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
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