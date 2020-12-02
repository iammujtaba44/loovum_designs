import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loovum_designs/services/models/MainHomeModel.dart';
import 'package:loovum_designs/services/requestServices/RequestGetters.dart';
import 'package:loovum_designs/services/requestServices/constants.dart';
import 'package:loovum_designs/ui/screens/home/home_expired_product_page.dart';
import 'package:loovum_designs/ui/screens/home/home_live_product_page%20copy.dart';

import 'package:loovum_designs/ui/shared/widgets/appBar.dart';

import '../../sign_in_screen.dart';

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
      home: Scaffold(body: Center(child: ProductsPage())),
    );
  }
}

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  bool hasData = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    bool result = await GetMethods.productHomeInit();
    if (result) {
      if (mounted)
        setState(() {
          hasData = true;
        });
    } else if (mounted)
      setState(() {
        hasData = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return !hasData
        ? Container(
            child: Center(
            child: SpinKitFadingFour(
              color: const Color(0xFFE6798A),
              size: 50.0,
            ),
          ))
        : ListView.builder(
            itemCount: Constants.mainHomeModel.count,
            itemBuilder: (context, index) {
              return _item(Constants.mainHomeModel.products[index], index);
            }
            // children: [
            //   _item(),
            //   _item(),
            // ],
            );
  }

  List<int> _likeList = List();

  Padding _item(Product data, int index) {
    var ScreenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 35, right: 18, left: 18),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (Constants.loginModel != null) {
                if (data.activate == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                                body: ListView(
                                    physics: BouncingScrollPhysics(),
                                    padding: EdgeInsets.all(0),
                                    children: [
                                  LiveProductPage(
                                    slug: data.slug,
                                  )
                                ]))),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                                body: ListView(
                                    physics: BouncingScrollPhysics(),
                                    padding: EdgeInsets.all(0),
                                    children: [
                                  ExpiredProductPage(
                                    slug: data.slug,
                                  )
                                ]))),
                  );
                }
              } else {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SignInScreen()));
              }
            },
            child: Container(
              height: ScreenSize.height * 0.57,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://api.scentpeeks.com/${data.image ?? false}')),
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Text(
                '${data.title} | ${data.attributes[0].sku} - ${data.attributes[data.attributes.length - 1].sku}',
                style: TextStyle(fontSize: 15.0),
              ),
              Spacer(),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (Constants.loginModel != null) {
                        if (_likeList.contains(index))
                          setState(() {
                            _likeList.remove(index);
                          });
                        else
                          setState(() {
                            _likeList.add(index);
                          });
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignInScreen()));
                      }
                    },
                    child: !_likeList.contains(index)
                        ? Icon(
                            Icons.favorite_border,
                            size: 19,
                            color: Colors.grey,
                          )
                        : Icon(
                            Icons.favorite,
                            size: 19,
                            color: Colors.red,
                          ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  _likeList.contains(index)
                      ? Text(
                          '${data.favCount + 1}',
                          style: TextStyle(color: Colors.grey),
                        )
                      : Text(
                          '${data.favCount}',
                          style: TextStyle(color: Colors.grey),
                        ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.0.w,
              top: 15.h,
            ),
            child: Row(
              children: [
                Text(
                  '\$${data.salePrice}',
                  style: TextStyle(color: Color(0xFFE6798A), fontSize: 15.0),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Row(
                  children: [
                    Text(
                      '\$${data.price}',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 13.0),
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
