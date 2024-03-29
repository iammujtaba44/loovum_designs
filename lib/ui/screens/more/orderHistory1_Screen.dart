import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:loovum_designs/services/requestServices/constants.dart';
import 'package:loovum_designs/ui/screens/more/settings_screen.dart';
import 'package:loovum_designs/ui/shared/widgets/heighRatio.dart';
import 'package:loovum_designs/ui/shared/widgets/pink_button.dart';

import 'package:loovum_designs/ui/shared/widgets/appBar.dart';

class OrderHistory1 extends StatefulWidget {
  var orderId;
  var productId;
  IconData icon;
  OrderHistory1({this.orderId, this.productId, this.icon});

  @override
  State<StatefulWidget> createState() {
    return OrderHistory1State();
  }
}

class OrderHistory1State extends State<OrderHistory1> {
  int pageIndex = 0;
  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    var ScreenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Colors.white,
            //  height: ScreenSize.height,
            // width: ScreenSize.width,
            child: Column(
              children: [
                appBar(height: 120.h, width: 750.w, title: '6-17-19'),
                _listview(context,
                    orderId: widget.orderId,
                    productId: widget.productId,
                    icon: widget.icon)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_listview(BuildContext context, {int orderId, int productId, IconData icon}) {
  var ScreenSize = MediaQuery.of(context).size;
  String date = DateFormat("EEE, d MMM yyyy HH:mm:ss")
      .format(Constants.ordersModel[orderId].createdAt);
  var datef = date.split(' ');
  return Column(
    children: [
      Container(
        // padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
        color: Colors.white10,
        width: MediaQuery.of(context).size.width,
        height: getScreenHeight(context) == 0
            ? ScreenSize.height * 0.32
            : getScreenHeight(context) == 1
                ? ScreenSize.height * 0.25
                : ScreenSize.height * 0.23,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 25.0, bottom: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${datef[2]}, ${datef[1]} ${datef[3]}',
                    style: TextStyle(
                        fontSize: 30.0.w, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$${Constants.ordersModel[orderId].totalAmount}",
                    style: TextStyle(
                        fontSize: 30.0.w, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.all(0),
                                leading: Container(
                                  height: 80,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: Colors.grey,
                                  ),
                                ),
                                title: Text(
                                  '${Constants.ordersModel[orderId].products[productId].product.title}',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                trailing:
                                    Icon(Icons.keyboard_arrow_right_sharp),
                                onTap: () {},
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 70,
                  top: 1,
                  child: Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                          color: const Color(0xFFE6798A),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Center(
                        child: Icon(
                          icon,
                          color: Colors.white,
                          size: 12,
                        ),
                      )),
                ),
              ],
            ),
            Container(
              child: pinkButton(
                  func: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) =>
                    //           Scaffold(body: Center(child: SettingsScreen()))),
                    // );
                  },
                  height: getScreenHeight(context) == 0
                      ? ScreenSize.height * 0.09
                      : ScreenSize.height * 0.065,
                  width: MediaQuery.of(context).size.width,
                  title:
                      "${Constants.ordersModel[orderId].products[productId].status} - ${datef[0]} ${datef[2]} ${datef[1]}"),
            )
          ],
        ),
      ),
      _container(
          context,
          "Shipping Address",
          "Orkhan Rasulov ",
          "409 Summerbrook Dr Atlanta, GA 30350",
          Icon(
            Icons.home,
            size: 30.0,
            color: Colors.grey,
          ),
          () {}),
      Divider(
        thickness: 2,
      ),
      _container(
          context,
          "Payment Method",
          "Orkhan Rasulov ",
          "409 Summerbrook Dr Atlanta, GA 30350",
          Icon(
            Icons.payment,
            size: 30.0,
            color: Colors.grey,
          ),
          () {}),
      Divider(
        thickness: 2,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        color: Colors.white10,
        width: MediaQuery.of(context).size.width,
        height: 300.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order ID',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 30.0.w)),
                Text(
                  '${Constants.ordersModel[orderId].products[productId].orderId}',
                  style: TextStyle(fontWeight: FontWeight.w400),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Seller',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 30.0.w)),
                Text(
                  'Loovum Clothing',
                  style: TextStyle(fontWeight: FontWeight.w400),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('3/22/Style 4',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 30.0.w)),
                Text(
                  '01',
                  style: TextStyle(fontWeight: FontWeight.w400),
                )
              ],
            ),
          ],
        ),
      ),
      Divider(
        thickness: 2,
        indent: 20.0,
        endIndent: 20.0,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        color: Colors.white10,
        width: MediaQuery.of(context).size.width,
        height: 300.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('SUBTOTAL',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 25.0.w)),
                Text(
                  '\$${Constants.ordersModel[orderId].products[productId].price}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('SHIPPING',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 25.0.w)),
                Text(
                  '\$${Constants.ordersModel[orderId].products[productId].shippingCharge}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('TOTAL',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 30.0.w)),
                Text(
                  '\$${Constants.ordersModel[orderId].totalAmount}',
                  style: TextStyle(fontWeight: FontWeight.w700),
                )
              ],
            ),
          ],
        ),
      ),
      Divider(
        thickness: 2,
      ),
      ListTile(
        title: Text(
          "Track Package",
          style: TextStyle(
              fontSize: 30.0.w,
              color: Colors.purple,
              fontWeight: FontWeight.w500),
        ),
      ),
      Divider(
        thickness: 2,
      ),
      ListTile(
        title: Text(
          "Contact Customer Service",
          style: TextStyle(
              fontSize: 30.0.w,
              color: Colors.purple,
              fontWeight: FontWeight.w500),
        ),
      ),
      Divider(
        thickness: 2,
      ),
      SizedBox(
        height: 60.0,
      ),
    ],
  );
}

_container(BuildContext context, String _primaryname, String _defaultAdd,
    String _secondAdd, Icon _icon, Function _func) {
  var ScreenSize = MediaQuery.of(context).size;
  return Container(
      padding: const EdgeInsets.only(top: 20.0, left: 12.0),
      height: getScreenHeight(context) == 0
          ? ScreenSize.height * 0.18
          : ScreenSize.height * 0.13,
      width: ScreenSize.width,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 12.0),
              child: _icon,
            ),
            Row(
              children: [
                //   _icon,
                Container(
                  margin: EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        _primaryname,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.w,
                        ),
                      ),
                      Wrap(
                        spacing: 10.0,
                        children: [
                          Text(_defaultAdd,
                              style: TextStyle(
                                  color: const Color(0xFFC1B6DF),
                                  fontSize: 20.0.w)),
                          Text(
                            "(Default)",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 20.0.w),
                          )
                        ],
                      ),
                      Text(_secondAdd,
                          style: TextStyle(
                              color: const Color(0xFFC1B6DF), fontSize: 20.0.w))
                    ],
                  ),
                ),
                SizedBox(
                  width: getScreenHeight(context) == 0
                      ? ScreenSize.width * 0.24
                      : getScreenHeight(context) == 1
                          ? ScreenSize.width * 0.25
                          : ScreenSize.width * 0.33,
                ),
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    size: 30.0,
                    color: Colors.grey,
                  ),
                  onPressed: _func,
                ),
              ],
            ),
          ]));
}
