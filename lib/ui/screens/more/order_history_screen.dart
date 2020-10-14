import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/screens/more/editProfile.dart';
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
      home: Scaffold(body: Center(child: OrderHistoryScreen())),
    );
  }
}

class OrderHistoryScreen extends StatefulWidget {
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
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
    return SafeArea(
      child: Column(
        children: [
          appBar(height: 120.h, width: 750.w, title: 'Order History'),
          _listView(list, context),
        ],
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

_listView(List<String> list, BuildContext context) {
  return Expanded(
    child: Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 26, top: 20),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Scaffold(body: Center(child: EditProfile())),
                        ));
                  },
                  child: Text(
                    'Jun 17, 2019',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Text(
                '\$23.76',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.all(0),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Stack(
                    children: [
                      ListTile(
                        leading: Container(
                          height: 80,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.pink,
                          ),
                        ),
                        title: Text(
                          'Flexible Yoga Pants',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text('Shipped - Mon, Jun 24'),
                        onTap: () {},
                      ),
                      Positioned(
                        left: 70,
                        top: 1,
                        child: Container(
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                      ),
                    ],
                  ),
                  index == 2
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Divider(
                            thickness: 1,
                          ))
                      : Container(),
                ],
              );
            },
            separatorBuilder: (context, index) {
              var dottedDecoration = DottedDecoration(
                  shape: Shape.line, linePosition: LinePosition.bottom);
              return Padding(
                padding: const EdgeInsets.only(bottom: 8, right: 16, left: 16),
                child: Container(
                  decoration: dottedDecoration,
                  child: Text(''),
                ),
              );
            },
          ),
        ),
      ],
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
