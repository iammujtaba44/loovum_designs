import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/screens/more/about.dart';
import 'package:loovum_designs/ui/screens/more/accountSetting.dart';
import 'package:loovum_designs/ui/screens/more/order_history_screen.dart';
import 'package:loovum_designs/ui/shared/widgets/pink_button.dart';

import 'package:loovum_designs/ui/shared/widgets/appBar.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingsScreenState();
  }
}

class SettingsScreenState extends State<SettingsScreen> {
  List<Widget> widgetsList = [
    OrderHistoryScreen(),
    OrderHistoryScreen(),
    AccountSettingPage(),
    OrderHistoryScreen(),
    AboutPage(),
    OrderHistoryScreen(),
  ];
  List<String> _list = [
    'Order History',
    'Review Purchases',
    'Account Settings',
    'Support',
    'About',
    'Log out'
  ];

  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    var ScreenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          //  height: ScreenSize.height,
          // width: ScreenSize.width,
          child: Column(
            children: [
              appBar(height: 120.h, width: 750.w, title: 'Setting'),
              Flexible(
                child: ListView.builder(
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Scaffold(
                                      body: Center(child: widgetsList[index]))),
                            );
                          },
                          child: ListTile(
                            title: Text(
                              _list[index],
                              style: TextStyle(
                                  fontSize: 30.0.w,
                                  color: index == (_list.length - 1)
                                      ? Colors.grey
                                      : Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
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
      ),
    );
  }
}
