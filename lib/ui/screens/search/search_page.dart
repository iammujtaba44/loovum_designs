import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loovum_designs/services/models/search/EndingSoon.dart';

import 'package:loovum_designs/services/models/search/PopularModel.dart';
import 'package:loovum_designs/services/requestServices/RequestGetters.dart';
import 'package:loovum_designs/services/requestServices/constants.dart';
import 'package:loovum_designs/ui/screens/search/collections_page.dart';
import 'package:loovum_designs/ui/shared/roundedButton.dart';
import 'package:loovum_designs/ui/shared/widgets/appBar.dart';
import 'package:loovum_designs/ui/shared/widgets/heighRatio.dart';
import 'package:loovum_designs/ui/shared/widgets/pink_button.dart';
import 'package:preview/preview.dart';

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
        home: Scaffold(
          body: Center(child: SearchPage()),
        ));
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> _list = [
    'Women',
    'Shoes',
    'Jewelery & Accessories',
    'Accessories',
    'Jewellery'
  ];

  bool hasData = false;
  bool popularHasData = false;
  bool endingHasData = false;
  bool collectionHasData = false;

  getSearchResult() async {
    bool result = await GetMethods.searchDataInit('a');
    if (result) {
      if (mounted)
        setState(() {
          hasData = true;
        });
    } else {
      if (mounted)
        setState(() {
          hasData = false;
        });
    }
    print(Constants.searchModel.products[0]);
  }

  Future getPopularData() async {
    print('OKKa');
    bool result = await GetMethods.popularInit();
    if (result) {
      if (mounted)
        setState(() {
          popularHasData = true;
        });
    } else {
      if (mounted)
        setState(() {
          popularHasData = false;
        });
    }
    // print(Constants.popularModel.data[0]);
  }

  getEndingData() async {
    print('OKKa2');
    bool result = await GetMethods.endingSoonInit();
    if (result) {
      if (mounted)
        setState(() {
          endingHasData = true;
        });
    } else {
      if (mounted)
        setState(() {
          endingHasData = false;
        });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //  getSearchResult();
    getPopularData();

    // print(Constants.searchModel);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    var ScreenSize = MediaQuery.of(context).size;

    return _body();
  }

  _body() {
    var ScreenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          appBar(
              height: 150.h,
              width: 750.w,
              title: 'Order History',
              isSearchBar: true),
          SizedBox(
            height: 10.0,
          ),
          _horizList(),
          SizedBox(
            height: 10.0,
          ),
          _lowerListContainer(),
          _textContainer("Popular"),
          _popularGridView(),
          Container(
              margin: EdgeInsets.only(
                  left: 18.0, right: 18.0, bottom: 25.0, top: 15.0),
              child: RoundedButton(ScreenSize.width, 55.0, "See All Popular",
                  1.2, TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))),
          Container(
            margin: EdgeInsets.only(
                left: 18.0, right: 18.0, bottom: 25.0, top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Collections',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
                ),
                Text(
                  'View All',
                  style: TextStyle(color: Colors.pink),
                ),
              ],
            ),
          ),
          Container(
            //  margin: EdgeInsets.only(left: 17.0),
            color: Colors.white,
            height: ScreenSize.height > 650 && ScreenSize.height < 750
                ? 350.h
                : 300.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: 16.0,
                  ),
                  height: 100.h,
                  width: 470.w,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 6.0,
              left: 17.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shop Home Hub',
                ),
                Text(
                  'Shop Accessories',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          _textContainer("New Today"),
          // _gridViewContainer(),
          Container(
              margin: EdgeInsets.only(
                  left: 18.0, right: 18.0, bottom: 25.0, top: 15.0),
              child: RoundedButton(ScreenSize.width, 55.0, "See All New Today",
                  1.2, TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))),
          _textContainer("Ending Soon"),
          _endingSoonGridView(),
          Container(
              margin: EdgeInsets.only(
                  left: 18.0, right: 18.0, bottom: 25.0, top: 15.0),
              child: RoundedButton(
                  ScreenSize.width,
                  55.0,
                  "See All Ending Soon",
                  1.2,
                  TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400))),
        ]),
      ),
    );
  }

  _textContainer(String _label) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
      child: Text(
        _label,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
      ),
    );
  }

  _popularGridView() {
    var ScreenSize = MediaQuery.of(context).size;
    return !popularHasData
        ? Container(
            height: getScreenHeight(context) == 0
                ? ScreenSize.height * 0.6
                : getScreenHeight(context) == 1
                    ? ScreenSize.height * 0.5
                    : ScreenSize.height * 0.5,
            child: Center(
              child: SpinKitFadingFour(
                color: const Color(0xFFE6798A),
                size: 50.0,
              ),
            ),
          )
        : Container(
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

  _endingSoonGridView() {
    var ScreenSize = MediaQuery.of(context).size;
    return !endingHasData
        ? Container(
            height: getScreenHeight(context) == 0
                ? ScreenSize.height * 0.6
                : getScreenHeight(context) == 1
                    ? ScreenSize.height * 0.5
                    : ScreenSize.height * 0.5,
            child: Center(
              child: SpinKitFadingFour(
                color: const Color(0xFFE6798A),
                size: 50.0,
              ),
            ),
          )
        : Container(
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
                return _itemsEnding(Constants.endingSoonModel.data[index]);
              }),
            ),
          );
  }

  // _gridViewContainer() {
  //   var ScreenSize = MediaQuery.of(context).size;
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 17.0),
  //     height: getScreenHeight(context) == 0
  //         ? ScreenSize.height * 0.6
  //         : getScreenHeight(context) == 1
  //             ? ScreenSize.height * 0.5
  //             : ScreenSize.height * 0.5,
  //     child: GridView.count(
  //       shrinkWrap: true,
  //       physics: ClampingScrollPhysics(),
  //       mainAxisSpacing: 15.0,
  //       crossAxisCount: 2,
  //       crossAxisSpacing: 20.0,
  //       children: List.generate(4, (index) {
  //         return _items();
  //       }),
  //     ),
  //   );
  // }
  _itemsEnding(EndingSoonData data) {
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

  _lowerListContainer() {
    var ScreenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: ScreenSize.width,
          height: ScreenSize.height > 650 && ScreenSize.height < 750
              ? ScreenSize.height * 0.45
              : ScreenSize.height * 0.39,
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.0,
              ),
              Container(
                width: 500.w,
                child: Text(
                  'This Season\'s Color Palette',
                  style: TextStyle(
                    fontSize: ScreenSize.height * 0.055,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 22,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Scaffold(body: Center(child: CollectionPage())),
                      ));
                },
                child: Container(
                    alignment: Alignment.center,
                    color: const Color(0xFF022667),
                    width: ScreenSize.width * 0.5,
                    height: ScreenSize.height > 650 && ScreenSize.height < 750
                        ? ScreenSize.height * 0.077
                        : ScreenSize.height * 0.06,
                    child: Text(
                      'SHOP FALL COLORS',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenSize.width * 0.04),
                    )),
              ),
              SizedBox(
                height: 22,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                width: 50,
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _horizList() {
    var ScreenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(_list.length, (index) {
            return Container(
              margin: index == 0
                  ? const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 18.0)
                  : const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
              // padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              padding: const EdgeInsets.only(
                  top: 15.0, bottom: 15.0, left: 32.0, right: 32.0),
              alignment: Alignment.center,
              //  width: ScreenSize.width * 0.37,
              //  height: ScreenSize.height * 0.01,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  border: Border.all(color: Colors.grey)),
              child: Text(
                _list[index],
                style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w500),
              ),
            );
          }),
        ));
  }

  _topShortSummary({String title, String number}) {
    return Column(
      children: [
        Text(number),
        Text(title),
      ],
    );
  }

  appBar(
      {double height,
      double width,
      String title = 'Settings',
      bool isSearchBar = false}) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: height,
      width: width,
      color: Colors.grey[300],
      child: isSearchBar
          ? Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  readOnly: true,
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: 'Search...'),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(title),
            ),
    );
  }
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
