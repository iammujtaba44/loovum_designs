import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/shared/widgets/pink_button.dart';

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
      home: Scaffold(body: Center(child: AboutPage())),
    );
  }
}

class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AboutPageState();
  }
}

class AboutPageState extends State<AboutPage> {
  List<String> _list = ['Privacy Policy', 'Terms of use'];

  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    var ScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        //  height: ScreenSize.height,
        // width: ScreenSize.width,
        child: Column(
          children: [
            appBar(height: 120.h, width: 750.w, title: 'About'),
            Flexible(
              child: ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      ListTile(
                        title: Text(
                          _list[index],
                          style: TextStyle(
                              fontSize: 30.0.w,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                    ]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
