import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/screens/shoppingBag/addNewCard_Screen.dart';
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
      home: Scaffold(body: Center(child: AddShippingAddress())),
    );
  }
}

class AddShippingAddress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddShippingAddressState();
  }
}

class AddShippingAddressState extends State<AddShippingAddress> {
  final _form = GlobalKey<FormState>();

  bool _setAsDefault = false;

  bool _setAsDefaultSame = false;
  List<String> _cities = ['AA', 'BB', 'CC', 'DD']; // Option 2
  String _selectedCity;
  int pageIndex = 0;

  String _selectedState;
  String _selectedCountry;

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  initState() {
    //_selectedCity = _cities[0];
    _selectedCountry = _cities[0];
    super.initState();
  }

  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    var ScreenSize = MediaQuery.of(context).size;
    print(ScreenSize.height);
    return SafeArea(
      child: Form(
        key: _form,
        child: Scaffold(
          body: Container(
            color: Colors.white,
            //  height: ScreenSize.height,
            // width: ScreenSize.width,

            child: Column(
              children: [
                appBar(
                    height: 120.h, width: 750.w, title: 'Add Shipping Address'),
                SizedBox(height: 20.h),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(left: 13.0, right: 13.0),
                    child: ListView(children: [
                      Container(
                          margin: EdgeInsets.all(10.0),
                          child: Column(children: [
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'First Name'),
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
                              decoration:
                                  InputDecoration(labelText: 'Last Name'),
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
                              decoration:
                                  InputDecoration(labelText: 'Address Line 1'),
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
                              decoration:
                                  InputDecoration(labelText: 'Address Line 2'),
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Field is Empty';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 70.0.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: _getCountyDropdown(
                                        'City', _cities, 'City')),
                                SizedBox(width: 15.0),
                                Expanded(
                                    child: _getCountyDropdown(
                                        'State', _cities, 'State')),
                              ],
                            ),
                            SizedBox(
                              height: 70.0.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: _getCountyDropdown(
                                        'Country', _cities, 'Country')),
                                SizedBox(width: 15.0),
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: TextFormField(
                                    decoration:
                                        InputDecoration(labelText: 'Zip code'),
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Field is Empty';
                                      }
                                      return null;
                                    },
                                  ),
                                )),
                              ],
                            ),
                            SizedBox(
                              height: 40.0.h,
                            ),
                            _getSwitch('Set as default address'),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 40.0, horizontal: 10.0),
                              child: pinkButton(
                                  func: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Scaffold(
                                              body:
                                                  Center(child: AddNewCard()))),
                                    );
                                  },
                                  height: getScreenHeight(context) == 0
                                      ? ScreenSize.height * 0.08
                                      : ScreenSize.height * 0.065,
                                  width: MediaQuery.of(context).size.width,
                                  title: "Add Shipping Address"),
                            ),
                            SizedBox(
                              height: 30.0.h,
                            )
                          ]))
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getCountyDropdown(var hintText, List<String> _list, String _lableText) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
          icon: Icon(Icons.keyboard_arrow_down),
          iconSize: 22,
          style: TextStyle(
            fontSize: 13.0,
            color: Colors.black,
            // letterSpacing: 1.2,
          ),
          iconEnabledColor: Colors.grey,
          iconDisabledColor: Colors.red,
          items: _list.map((city) {
            return DropdownMenuItem(
              child: Text(city),
              value: city,
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _selectedCountry = newValue;
            });
          },
          value: _selectedCountry,
          isExpanded: true,
          decoration: InputDecoration(labelText: _lableText),
          hint: new Text(
            hintText,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  _getSwitch(String _data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(_data,
              style: TextStyle(fontSize: 30.0.w, fontWeight: FontWeight.w700)),
        ),
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
    );
  }

  _getSwitchSame(String _data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(_data,
              style: TextStyle(fontSize: 30.0.w, fontWeight: FontWeight.w700)),
        ),
        CupertinoSwitch(
          onChanged: (value) {
            setState(() {
              _setAsDefaultSame = value;
            });
          },
          activeColor: Colors.pink,
          value: _setAsDefaultSame,
        )
      ],
    );
  }
}

_bottomNavigationBar(Function onPageChanged, int pageIndex) {
  return CupertinoTabBar(
    items: [
      BottomNavigationBarItem(
          icon: ImageIcon(
        AssetImage('assets/images/home_black.png'),
      )),
      BottomNavigationBarItem(icon: Icon(Icons.search)),
      BottomNavigationBarItem(icon: Icon(Icons.camera_alt)),
      BottomNavigationBarItem(icon: Icon(Icons.notifications_active)),
      BottomNavigationBarItem(icon: Icon(Icons.person)),
    ],
    currentIndex: pageIndex,
    activeColor: Colors.black,
    inactiveColor: Color(0xFFC3C1C1),
    backgroundColor: Colors.white,
    onTap: onPageChanged,
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
