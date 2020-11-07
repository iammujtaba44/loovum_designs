import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/services/requestServices/RequestGetters.dart';
import 'package:loovum_designs/services/requestServices/RequestServices.dart';
import 'package:loovum_designs/services/requestServices/constants.dart';
import 'package:loovum_designs/ui/screens/home/home_tab_pages/sneak_peeks/sneak_peeks_dialog.dart';
import 'package:loovum_designs/ui/shared/widgets/appBar.dart';
import 'package:loovum_designs/ui/shared/widgets/heighRatio.dart';
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
      home: Scaffold(body: Center(child: SneakPeeksPage())),
    );
  }
}

class SneakPeeksPage extends StatefulWidget {
  @override
  _SneakPeeksPageState createState() => _SneakPeeksPageState();
}

class _SneakPeeksPageState extends State<SneakPeeksPage> {
  List<String> _list = [
    'Popular',
    'Graphic Tees',
    'Natural Design',
    'Accessories',
    'Jewellery'
  ];
  bool hasData = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    bool result = await GetMethods.requiredDataInit();
    if (result) {
      setState(() {
        hasData = true;
      });
    } else
      setState(() {
        hasData = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context).size;
    ScreenUtil.init(context, width: 750, height: 1334);
    return !hasData
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        color: Colors.grey,
                        width: ScreenSize.width,
                        height: getScreenHeight(context) == 0
                            ? ScreenSize.height * 0.45
                            : getScreenHeight(context) == 1
                                ? ScreenSize.height * 0.39
                                : ScreenSize.height * 0.35,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              ExitConfirmationDialog());
                                    },
                                    icon: Icon(
                                      Icons.help_outline,
                                      color: Colors.white,
                                      size: 27.0,
                                    ),
                                  )),
                            ],
                          ),
                          Text(
                            'SNEAK PEEKS',
                            style: TextStyle(
                                letterSpacing: 4, color: Colors.white),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Tomorrow\'s Products',
                            style: ScreenSize.height > 650 &&
                                    ScreenSize.height < 800
                                ? TextStyle(
                                    letterSpacing: 2,
                                    fontSize: 20,
                                    color: Colors.white)
                                : TextStyle(
                                    letterSpacing: 2,
                                    fontSize: 23,
                                    color: Colors.white),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          _getDeviderText('shoppable in'),
                          SizedBox(
                            height: 30.h,
                          ),
                          _container(),
                          SizedBox(
                            height: 26.0,
                          ),
                          Container(
                              width: 600.w,
                              child: Text(
                                'Sneak Peeks become visible after 2:00 pm ET. Purchasing a product prior will allow instant access.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white),
                              )),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.0),
                    child: Text(
                      'Why Wait? Shop Now',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  _bodyContainer(),
                ],
              ),
            ),
          );
  }

  _bodyContainer() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          children:
              List.generate(Constants.requiredModel.categories.length, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 11.0),
          child: GestureDetector(
            child: Container(
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              margin: EdgeInsets.only(bottom: 17.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text(Constants.requiredModel.categories[index].name,
                      style: TextStyle(fontSize: 18.0)),
                  Spacer(),
                  Container(
                    // height: 100.h,
                    width: 230.w,
                    color: Colors.grey,
                    child: Image.network(
                      Constants.requiredModel.categories[index].banner,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      })),
    );
  }

  _getDeviderText(String _label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 2.h,
          width: 122.w,
          color: Colors.white,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          _label,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          width: 4,
        ),
        Container(
          height: 2.h,
          width: 122.w,
          color: Colors.white,
        ),
      ],
    );
  }

  _card({String title, String imageUrl}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 11.0),
      child: GestureDetector(
        child: Container(
          height: 80.0,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          margin: EdgeInsets.only(bottom: 17.0),
          child: Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Text(title, style: TextStyle(fontSize: 18.0)),
              Spacer(),
              Container(
                // height: 100.h,
                width: 230.w,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _container() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dateContainer('11'),
        SizedBox(
          width: 50.w,
        ),
        _dateContainer('01'),
        SizedBox(
          width: 50.w,
        ),
        _dateContainer('45'),
      ],
    );
  }

  _dateContainer(String value) {
    return Container(
      height: 55,
      width: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(
        value,
        style: TextStyle(
          fontSize: 22,
        ),
      ),
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
