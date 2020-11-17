import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/shared/widgets/heighRatio.dart';
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
      home: Scaffold(body: Center(child: AddNewCard())),
    );
  }
}

class AddNewCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddNewCardState();
  }
}

class AddNewCardState extends State<AddNewCard> {
  final _form = GlobalKey<FormState>();

  bool _setAsDefault = true;

  bool _setAsDefaultSame = true;
  List<String> _cities = ['AA', 'BB', 'CC', 'DD']; // Option 2

  int pageIndex = 0;

  String _selectedCountry;

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  initState() {
    //_selectedCity = _cities[0];
    super.initState();
  }

  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    var ScreenSize = MediaQuery.of(context).size;
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
                    height: 120.h, width: 750.w, title: '<Card holder name>'),
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
                              decoration:
                                  InputDecoration(labelText: 'Card Number'),
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
                                    decoration: InputDecoration(
                                        labelText: 'Expiry date'),
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
                                    decoration:
                                        InputDecoration(labelText: 'CVV'),
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
                            _getSwitch('Set As Default card'),
                            SizedBox(
                              height: 30.h,
                            ),
                            _getSwitchSame('Shipping Address same as billing'),
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
                              height: 50.0.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: _getCountyDropdown('City', _cities)),
                                SizedBox(width: 15.0),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 13.0),
                                    child: TextFormField(
                                      decoration:
                                          InputDecoration(labelText: 'Country'),
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Field is Empty';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50.0.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration:
                                        InputDecoration(labelText: 'Post Code'),
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
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40.0.h,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 40.0,
                              ),
                              child: pinkButton(
                                  func: () {},
                                  height: getScreenHeight(context) == 0
                                      ? ScreenSize.height * 0.08
                                      : ScreenSize.height * 0.065,
                                  width: MediaQuery.of(context).size.width,
                                  title: "Add new card"),
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

  _getCountyDropdown(var hintText, List<String> _list) {
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
          decoration: InputDecoration(labelText: "City"),
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
