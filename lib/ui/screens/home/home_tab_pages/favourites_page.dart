import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loovum_designs/services/models/InstaShopModel.dart';
import 'package:loovum_designs/services/models/search/PopularModel.dart';
import 'package:loovum_designs/services/requestServices/RequestGetters.dart';
import 'package:loovum_designs/services/requestServices/constants.dart';
import 'package:loovum_designs/ui/screens/home/home_tab_pages/favourites_2_page.dart';
import 'package:loovum_designs/ui/shared/roundedButton.dart';
import 'package:loovum_designs/ui/shared/widgets/heighRatio.dart';
import 'package:loovum_designs/ui/shared/widgets/top_summary.dart';

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
      home: Scaffold(body: Center(child: FavouritesPage())),
    );
  }
}

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  bool hasData = false;
  bool favouriteCountHasData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    bool result = await GetMethods.popularInit();
    print(result);
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

    getFavouriteCounts();
  }

  getFavouriteCounts() async {
    bool result = await GetMethods.favouriteCount();
    print(result);
    if (result) {
      if (mounted) {
        setState(() {
          favouriteCountHasData = true;
        });
      } else if (mounted) {
        setState(() {
          favouriteCountHasData = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    var ScreenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: !favouriteCountHasData && !hasData
          ? Container(
              child: Center(
              child: SpinKitFadingFour(
                color: const Color(0xFFE6798A),
                size: 50.0,
              ),
            ))
          : Column(
              children: [
                _upperContainer(),
                _gridViewContainer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Favourites_2()));
                  },
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 18.0, right: 18.0, bottom: 25.0, top: 40.0),
                      child: RoundedButton(
                          ScreenSize.width,
                          55.0,
                          "View More",
                          1.2,
                          TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w400))),
                )
              ],
            ),
    );
  }

  _upperContainer() {
    var ScreenSize = MediaQuery.of(context).size;
    return Container(
      width: ScreenSize.width,
      height: getScreenHeight(context) == 0
          ? ScreenSize.height * 0.55
          : getScreenHeight(context) == 1
              ? ScreenSize.height * 0.48
              : ScreenSize.height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              topShortSummary(
                  title: 'Live',
                  number:
                      Constants.favouriteCountModel?.active.toString() ?? '0'),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: topShortSummary(
                    title: 'Sneak Peeks',
                    number:
                        Constants.favouriteCountModel?.sneakpeek.toString() ??
                            '0'),
              ),
              topShortSummary(
                  title: 'History',
                  number: Constants.favouriteCountModel?.inactive.toString() ??
                      '-'),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 45),
            child: Image.asset('assets/heart_icon.png'),
          ),
          SizedBox(
            height: 25.h,
          ),
          Container(
              width: 500.w,
              child: Text(
                'Sometimes it\'s okay to \nplay favourites',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              )),
          SizedBox(
            height: 25,
          ),
          Container(
            width: 580.w,
            child: Text(
              'if you loveit, just atp the heart and come back here to view your favourite items.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Text(
              'Shop Today\'s Top Products',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }

  _gridViewContainer() {
    var ScreenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 17.0),
      height: getScreenHeight(context) == 0
          ? ScreenSize.height * 0.6
          : getScreenHeight(context) == 1
              ? ScreenSize.height * 0.5
              : ScreenSize.height * 0.5,
      child: GridView.count(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        mainAxisSpacing: 15.0,
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        children: List.generate(4, (index) {
          return _items(Constants.popularModel.data[index]);
        }),
      ),
    );
  }

  _items(Dater data) {
    var ScreenSize = MediaQuery.of(context).size;
    MediaQueryData d = MediaQuery.of(context);
    return Column(
      children: [
        Expanded(
          child: Container(
            height: 400,
            width: ScreenSize.width,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: Text("PICTURES"),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 6.0,
            ),
            Text(
              '\$${data.salePrice}',
              style: TextStyle(
                  color: Color(0xFFE6798A), fontSize: ScreenSize.width * 0.04),
            ),
            SizedBox(
              width: 6.0,
            ),
            Text(
              '\$${data.price}',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: ScreenSize.width * 0.04,
                  color: Colors.grey),
            ),
            Spacer(),
            Icon(
              Icons.favorite_border,
              size: ScreenSize.width * 0.05,
              color: Colors.grey,
            ),
            SizedBox(width: 5.0),
            Text('${data.favCount}',
                style: TextStyle(
                    fontSize: ScreenSize.width * 0.04, color: Colors.grey))
          ],
        ),
      ],
    );
  }

  Padding _item() {
    return Padding(
        padding: EdgeInsets.only(
          top: 20,
          right: 15.w,
          left: 15.w,
        ),
        child: Column(children: [
          Container(
            height: 200.h,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '\$14.51',
                    style: TextStyle(color: Color(0xFFE6798A), fontSize: 13),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    '\$8.23',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough, fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
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
                  )
                ],
              ),
            ],
          ),
        ]));
  }
}
