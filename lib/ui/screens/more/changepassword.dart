import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/screens/more/accountSetting.dart';
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
      home: Scaffold(body: Center(child: ChangePassword())),
    );
  }
}

class ChangePassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChangePasswordState();
  }
}

class ChangePasswordState extends State<ChangePassword> {
  List<String> _list = [
    'Order History',
    'Review Purchases',
    'Account Settings',
    'Support',
    'About',
    'Log out'
  ];
  final _form = GlobalKey<FormState>();
  bool _obscureText = true;

  void _viewPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    var ScreenSize = MediaQuery.of(context).size;
    return Form(
      key: _form,
      child: Scaffold(
        body: Container(
          color: Colors.white,
          //  height: ScreenSize.height,
          // width: ScreenSize.width,
          child: Column(
            children: [
              appBar(height: 120.h, width: 750.w, title: 'Change password'),
              Flexible(
                child: ListView(
                  children: [
                    Container(
                        margin: EdgeInsets.all(15.0),
                        child: Column(children: [
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Current Password',
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: _viewPassword,
                                )),
                            obscureText: _obscureText,
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
                            decoration: InputDecoration(
                                labelText: 'New Password',
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: _viewPassword,
                                )),
                            textInputAction: TextInputAction.next,
                            obscureText: _obscureText,
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
                            decoration: InputDecoration(
                                labelText: 'Confirm New Password',
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: _viewPassword,
                                )),
                            textInputAction: TextInputAction.next,
                            obscureText: _obscureText,
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
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 30.0, horizontal: 10.0),
                            child: pinkButton(
                              func: () {
                                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Scaffold(
                                            body: Center(
                                                child: AccountSettingPage())),
                                      ));
                              },
                                height: 80.h,
                                width: MediaQuery.of(context).size.width,
                                title: "Update password"),
                          ),
                          SizedBox(
                            height: 30.0.h,
                          )
                        ]))
                  ],
                ),
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