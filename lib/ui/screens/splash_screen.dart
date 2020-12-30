import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/screens/home/home.dart';
import 'package:loovum_designs/ui/screens/sign_in_screen.dart';
import 'package:loovum_designs/ui/screens/sign_up_screen.dart';
import 'package:loovum_designs/ui/shared/widgets/heighRatio.dart';

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
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context).size;
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: ScreenSize.height / 2.5,
              ),
              Center(
                  child: Image.asset(
                'assets/logo.png',
                height: 50.0,
              )),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: 500.w,
                child: Text(
                  'Shop over 2000+ products from your favourite store, in one place.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: getScreenHeight(context) == 0
                    ? 170.0
                    : getScreenHeight(context) == 1
                        ? 222.0
                        : 260.0,
              ),
              SizedBox(
                height: getScreenHeight(context) == 0
                    ? ScreenSize.height * 0.075
                    : getScreenHeight(context) == 1
                        ? ScreenSize.height * 0.071
                        : ScreenSize.height * 0.069,
                width: ScreenSize.width * 0.85,
                child: RaisedButton(
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xFFE6798A),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );

                    // Home()),
                  },
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a Loovum member? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Text('Sign up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE6798A))),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(360.0),
            ),
            child: Container(
              height: 330.h,
              width: 330.h,
              color: Color(0xFFE6798A),
            ),
          ),
        ],
      ),
    );
  }
}
