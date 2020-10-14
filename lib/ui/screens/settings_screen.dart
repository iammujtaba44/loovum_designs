import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/shared/widgets/appBar.dart';
import 'package:preview/preview.dart';

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
      home: Scaffold(body: Center(child: SignUpScreen())),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  List<String> list = [
    'Order History',
    'Review Puchases',
    'Account Settings',
    'Support',
    'About',
    'Log Out'
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Column(
      children: [
        
         appBar(height: 120.h, width: 750.w, title: 'Settings'),
        _listView(list),
      ],
    );
  }
}

Column textField(String title, String hintText, {bool isObscure = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(),
      ),
      TextField(
        obscureText: isObscure,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.black),
          hintText: hintText,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF00C569))),
        ),
      ),
    ],
  );
}

_listView(List<String> list) {
  return Expanded(
    child: ListView.separated(
      padding: EdgeInsets.all(0),
      itemCount: 6,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(list[index]),
          onTap: () {},
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          thickness: 1,
          height: 0,
        );
      },
    ),
  );
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
