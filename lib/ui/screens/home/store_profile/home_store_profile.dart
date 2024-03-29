import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loovum_designs/services/requestServices/RequestGetters.dart';
import 'package:loovum_designs/services/requestServices/constants.dart';
import 'package:loovum_designs/ui/screens/home/home_tab_pages/favourites_page.dart';
import 'package:loovum_designs/ui/screens/home/home_tab_pages/products_page.dart';
import 'package:loovum_designs/ui/screens/home/home_tab_pages/sneak_peeks/sneak_peeks_page.dart';
import 'package:loovum_designs/ui/screens/home/store_profile/store_tab_screens/store_about_page.dart';
import 'package:loovum_designs/ui/screens/home/store_profile/store_tab_screens/store_products_page.dart';
import 'package:loovum_designs/ui/screens/home/store_profile/store_tab_screens/store_reviews_page.dart';
import 'package:loovum_designs/ui/shared/widgets/appBar.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';

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
      home: StoreProfile(),
    );
  }
}

class StoreProfile extends StatefulWidget {
  String sellerName;
  String sellerId;
  StoreProfile({this.sellerId, this.sellerName});
  @override
  _StoreProfileState createState() => _StoreProfileState();
}

class _StoreProfileState extends State<StoreProfile> {
  bool hasData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    bool result = await GetMethods.sellerInit(sellerName: widget.sellerName);

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
  }

  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context).size;
    ScreenUtil.init(context, width: 750, height: 1334);
    return !hasData
        ? Container(
            height: ScreenSize.height > 650 && ScreenSize.height < 750
                ? 350.h
                : 300.h,
            child: Center(
              child: SpinKitFadingFour(
                color: const Color(0xFFE6798A),
                size: 50.0,
              ),
            ),
          )
        : SafeArea(
            child: DefaultTabController(
              initialIndex: 0,
              length: 3,
              child: Scaffold(
                body: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      appBar(
                          height: 120.h, width: 750.w, title: 'Seller Profile'),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.black,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            Constants.sellerModel.name,
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(Constants.sellerModel.location,
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: SmoothStarRating(
                                rating: 3,
                                isReadOnly: false,
                                size: 20,
                                color: Colors.yellow,
                                borderColor: Colors.yellow,
                                filledIconData: Icons.star,
                                halfFilledIconData: Icons.star_half,
                                defaultIconData: Icons.star_border,
                                starCount: 5,
                                allowHalfRating: true,
                                spacing: 2.0,
                                onRated: (value) {
                                  print("rating value -> $value");
                                  // print("rating value dd -> ${value.truncate()}");
                                },
                              )),
                              Text(' (${Constants.sellerModel.ratingCount})'),
                              Text(' reviews')
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 13.0),
                      Divider(
                        thickness: 1.5,
                      ),
                      TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey[400],
                        indicatorColor: Colors.grey,
                        tabs: [
                          Tab(
                              child: Text(
                            'Products',
                          )),
                          Tab(child: Text('Reviews')),
                          Tab(child: Text('About')),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            StoreProductsPage(
                              sellerId: widget.sellerId,
                            ),
                            StoreReviewsPage(
                              sellerId: widget.sellerId,
                            ),
                            StoreAboutPage(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
