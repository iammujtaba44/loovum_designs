import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:loovum_designs/services/models/more/orderModel.dart';
import 'package:loovum_designs/services/requestServices/RequestGetters.dart';
import 'package:loovum_designs/services/requestServices/constants.dart';
import 'package:loovum_designs/ui/screens/more/editProfile.dart';
import 'package:loovum_designs/ui/screens/more/orderHistory1_Screen.dart';
import 'package:loovum_designs/ui/shared/widgets/appBar.dart';

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

  bool hasData = false;
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    bool result = await GetMethods.orderInit();

    if (result) {
      if (mounted) {
        setState(() {
          hasData = true;
        });
      }
    } else if (mounted) {
      setState(() {
        hasData = false;
      });
    }

    print(Constants.ordersModel.length);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return SafeArea(
      child: Column(
        children: [
          appBar(height: 120.h, width: 750.w, title: 'Order History'),
          !hasData
              ? Container(
                  child: Center(
                    child: SpinKitFadingFour(
                      color: const Color(0xFFE6798A),
                      size: 50.0,
                    ),
                  ),
                )
              : _listView(list, context),
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
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.all(0),
            itemCount: Constants.ordersModel.length,
            itemBuilder: (context, index) {
              String date = DateFormat("EEE, d MMM yyyy HH:mm:ss")
                  .format(Constants.ordersModel[index].createdAt);

              // print(date);
              var datef = date.split(' ');
              // print(datef[0]);
              // print(datef[1]);
              // print(datef[2]);
              // print(datef[3]);
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 26, top: 20),
                    child: Row(
                      children: [
                        Text(
                          '${datef[2]}, ${datef[1]} ${datef[3]}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Text(
                          '\$${Constants.ordersModel[index].totalAmount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: List.generate(
                        Constants.ordersModel[index].products.length,
                        (itemIndex) {
                      if (itemIndex == 0) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderHistory1(
                                          productId: itemIndex,
                                          orderId: index,
                                          icon: Icons.local_shipping,
                                        )));
                          },
                          child: _getColumn(
                              data: Constants
                                  .ordersModel[index].products[itemIndex],
                              icon: Icons.local_shipping,
                              itemIndex: itemIndex),
                        );
                      } else if (itemIndex == 1) {
                        return _getColumn(
                            data: Constants
                                .ordersModel[index].products[itemIndex],
                            icon: Icons.check,
                            itemIndex: itemIndex);
                      } else if (itemIndex == 2) {
                        return _getColumn(
                            data: Constants
                                .ordersModel[index].products[itemIndex],
                            icon: Icons.more_horiz_sharp,
                            itemIndex: itemIndex);
                      } else if (itemIndex == 3) {
                        return _getColumn(
                            data: Constants
                                .ordersModel[index].products[itemIndex],
                            icon: Icons.not_interested,
                            itemIndex: itemIndex);
                      }
                      if (itemIndex == 4) {
                        return _getColumn(
                            data: Constants
                                .ordersModel[index].products[itemIndex],
                            icon: Icons.subdirectory_arrow_left,
                            itemIndex: itemIndex);
                      } else {
                        return Column(
                          children: [
                            Stack(
                              children: [
                                ListTile(
                                  leading: Container(
                                    height: 80,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: Colors.pink,
                                    ),
                                  ),
                                  title: Text(
                                    'Flexible Yoga Pants',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                  ),
                                ),
                              ],
                            ),
                            itemIndex == 2
                                ? SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8, right: 16, left: 16),
                                    child: Container(
                                      decoration: DottedDecoration(
                                          shape: Shape.line,
                                          linePosition: LinePosition.bottom),
                                    ),
                                  )
                          ],
                        );
                      }
                    }),
                  )
                ],
              );
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8, right: 16, left: 16),
                child: Divider(
                  thickness: 2,
                ),
              );
              //  var dottedDecoration = DottedDecoration(
              //   shape: Shape.line, linePosition: LinePosition.bottom);
              // return Padding(
              //   padding: const EdgeInsets.only(bottom: 8, right: 16, left: 16),
              //   child: Container(
              //     decoration: dottedDecoration,
              //     child: Text(''),
              //   ),
              // );
            },
          ),
        ),
      ],
    ),
  );
}

_getColumn({ProductElement data, IconData icon, int itemIndex}) {
  String date = DateFormat("EEE, d MMM yyyy HH:mm:ss").format(data.createdAt);

  // print(date);
  var datef = date.split(' ');
  // print(datef[0]);
  // print(datef[1]);
  // print(datef[2]);
  // print(datef[3]);

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
                color: Colors.grey,
              ),
            ),
            title: Text(
              '${data.product.title}',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle:
                Text('${data.status} - ${datef[0]} ${datef[2]} ${datef[1]}'),
            onTap: () {},
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
              ),
            ),
          ),
        ],
      ),
      itemIndex == 4
          ? SizedBox()
          : Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 16, left: 16),
              child: Container(
                decoration: DottedDecoration(
                    shape: Shape.line, linePosition: LinePosition.bottom),
              ),
            )
    ],
  );
}
