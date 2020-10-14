import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/screens/home/home.dart';
import 'package:loovum_designs/ui/shared/widgets/heighRatio.dart';
import 'package:loovum_designs/ui/shared/widgets/pink_button.dart';
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
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.h,
            ),
            Center(
              child: Container(
                height: 100.h,
                width: 200.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
            ),
            SizedBox(
              height: 28.0,
            ),
            _bodyContainer()
          ],
        ),
      ),
    );
  }

  _bodyContainer() {
    var ScreenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 5.h),
      height: getScreenHeight(context) == 0
          ? ScreenSize.height * 0.72
          : getScreenHeight(context) == 1
              ? ScreenSize.height * 0.66
              : ScreenSize.height * 0.62,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            SizedBox(
              height: ScreenSize.height * 0.06,
            ),
            textField('Name', 'Faraz Ahmed'),
            SizedBox(
              height: ScreenSize.height * 0.055,
            ),
            textField('Email', 'farazahmed@gmail.com'),
            SizedBox(
              height: ScreenSize.height * 0.055,
            ),
            textField('Password', 'abc123123', isObscure: true),
            SizedBox(
              height: ScreenSize.height * 0.07,
            ),
            SizedBox(
              height: ScreenSize.height * 0.075,
              width: ScreenSize.width * 0.85,
              child: RaisedButton(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xFFE6798A),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
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
