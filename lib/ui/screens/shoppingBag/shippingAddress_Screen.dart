import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loovum_designs/ui/screens/shoppingBag/addShippingAddresss_screen.dart';
import 'package:loovum_designs/ui/screens/shoppingBag/paymentMethods_screen.dart';
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
      home: Scaffold(body: Center(child: ShippingAddress())),
    );
  }
}

class ShippingAddress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShippingAddressState();
  }
}

class ShippingAddressState extends State<ShippingAddress> {
  final _form = GlobalKey<FormState>();

  bool _setAsDefault = false;

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
              appBar(height: 120.h, width: 750.w, title: 'Shipping address'),
              SizedBox(height: 20.h),
              Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: ListTile(
                  title: Text('House#23, street 9',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  subtitle: Text(
                    'Baku, Azerbaijan',
                  ),
                ),
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Edit',
                    color: Colors.black,
                    icon: Icons.more_horiz,
                    onTap: () {},
                  ),
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () {},
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                            body: Center(child: AddShippingAddress()))),
                  );
                },
                title: Text('Add Shipping Address',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.pink,
                    )),
                trailing: Icon(Icons.keyboard_arrow_right, size: 50.0.w),
              ),
              Divider(
                thickness: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
