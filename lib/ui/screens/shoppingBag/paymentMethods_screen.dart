import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/screens/shoppingBag/addNewCard_Screen.dart';
import 'package:loovum_designs/ui/screens/shoppingBag/paymentMethod_NewCard_Screen.dart';
import 'package:loovum_designs/ui/shared/widgets/pink_button.dart';

import 'package:loovum_designs/ui/shared/widgets/appBar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
      home: Scaffold(body: Center(child: PaymentMethod())),
    );
  }
}

class PaymentMethod extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PaymentMethodState();
  }
}

class PaymentMethodState extends State<PaymentMethod> {
  @override
  @override
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
              appBar(height: 120.h, width: 750.w, title: 'Payment Methods'),
              SizedBox(height: 20.h),
              Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: ListTile(
                  title: Text('ORKHAN RASULOV',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      )),
                  subtitle: Text(
                    'Card ending in 4456',
                  ),
                  trailing: Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Text('Default',
                          style: TextStyle(
                              color: Colors.white, fontSize: 30.0.w))),
                ),
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () {},
                  ),
                ],
              ),
              Divider(thickness: 2),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0.h),
                color: Colors.white10,
                width: MediaQuery.of(context).size.width,
                height: ScreenSize.height * 0.16,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0.w,
                        ),
                        child: Text(
                          "Add new",
                          style: TextStyle(
                              fontSize: 30.0.w, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Scaffold(
                                    body: Center(child: AddNewCard()))),
                          );
                        },
                        leading: Icon(
                          Icons.payment,
                          size: 40.0,
                        ),
                        title: Text('Credit or Debit card',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 35.0.w)),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          size: 40.0,
                        ),
                      )
                    ]),
              ),
              Divider(thickness: 2),
            ],
          ),
        ),
      ),
    );
  }
}
