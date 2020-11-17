import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/screens/home/home_live_product_page%20copy.dart';
import 'package:loovum_designs/ui/screens/home/home_tab_pages/sneak_peeks/sneak_peeks_dialog.dart';
import 'package:loovum_designs/ui/screens/home/store_profile/home_store_profile.dart';
import 'package:loovum_designs/ui/screens/home/store_profile/live_product.dart';
import 'package:loovum_designs/ui/shared/widgets/appBar.dart';
import 'package:loovum_designs/ui/shared/widgets/top_summary.dart';
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
      home: Scaffold(
          body: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(0),
              children: [ExpiredProductPage()])),
    );
  }
}

class ExpiredProductPage extends StatefulWidget {
  @override
  _ExpiredProductPageState createState() => _ExpiredProductPageState();
}

class _ExpiredProductPageState extends State<ExpiredProductPage> {
  var rating = 3.0;
  bool isClick = false;
  bool xxl = false, xl = false, m = false, l = false;

  bool _productTile = false;
  bool _shippingTile = false;

  bool _reviewsTile = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    var ScreenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          appBarWithIcon(
              height: 120.h,
              width: ScreenSize.width,
              title: 'Flexible Gym Pants',
              iconbtn: IconButton(
                  icon: Icon(Icons.keyboard_arrow_left_sharp,
                      color: Colors.black),
                  onPressed: null),
              trailingIcon: IconButton(
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                  ),
                  onPressed: null)),
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Scaffold(
                              body: ListView(
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.all(0),
                                  children: [LiveProduct()]))));
                },
                child: Container(
                  color: Colors.grey,
                  height: ScreenSize.height * 0.69,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  alignment: Alignment.center,
                  width: 55,
                  height: 25,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text('1 of 15'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 17.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StoreProfile()),
                      );
                    },
                    child: _littleSamplePhoto(),
                  ),
                  _littleSamplePhoto(),
                  _littleSamplePhoto(),
                  _littleSamplePhoto(),
                  _littleSamplePhoto(),
                  _littleSamplePhoto(),
                ],
              ),
            ),
          ),
          _itemInfo(),
          SizedBox(
            height: 38.0,
          ),
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 17.0, right: 8.0),
                  child: Image.asset('assets/images/delivery_car.png')),
              Text('This seller usually ships within 2 days.'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17.0, right: 17.0, top: 10.0),
            child: Row(
              children: [
                Center(
                    child: SmoothStarRating(
                  color: Colors.yellow,
                  borderColor: Colors.yellow,
                  rating: rating,
                  isReadOnly: false,
                  size: 20,
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
                Text('(120)'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17.0, right: 17.0),
            child: Row(
              children: [
                Text('Size'),
                Spacer(),
                _itemSize(
                  'XXL',
                  xxl,
                  func: () {
                    setState(() {
                      xxl = !xxl;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                _itemSize(
                  'XL',
                  xl,
                  func: () {
                    setState(() {
                      xl = !xl;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                _itemSize(
                  'M',
                  m,
                  func: () {
                    setState(() {
                      m = !m;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                _itemSize(
                  'L',
                  l,
                  func: () {
                    setState(() {
                      l = !l;
                    });
                  },
                )
              ],
            ),
          ),
          Padding(
              padding:
                  const EdgeInsets.only(left: 17.0, right: 12.0, top: 25.0),
              child: Row(
                children: [
                  Text('Colors'),
                  Spacer(),
                  _selectColors(
                    false,
                    func: () {},
                    color: Colors.grey,
                  ),
                  _selectColors(false, func: () {}, color: Colors.black),
                  _selectColors(false, func: () {}, color: Color(0xFFB74FAF))
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(
                left: 17.0, right: 17.0, top: 45.0, bottom: 8.0),
            child: SizedBox(
              width: ScreenSize.width,
              height: ScreenSize.height * 0.07,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.grey)),
                child: Text(
                  'Expired',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300),
                ),
                onPressed: () {},
              ),
            ),
          ),
          Divider(
            thickness: 1.5,
          ),
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              topShortSummary(number: '46%', title: 'SAVED'),
              topShortSummary(number: '00:00:00', title: 'TIME\'SUP'),
              topShortSummary(number: '2', title: 'SOLD'),
            ],
          ),
          SizedBox(
            height: 12.0,
          ),
          Divider(
            thickness: 1.5,
          ),
          SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Text('Sold By'),
              )),
          Container(
            margin: EdgeInsets.only(left: 2.0, right: 17.0, top: 13.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xFF8589F7),
              ),
              title: Text('Little Price Culture'),
              subtitle: Row(
                children: [
                  Center(
                      child: SmoothStarRating(
                    rating: rating,
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
                  Text('(120)'),
                ],
              ),
              trailing: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.keyboard_arrow_right)),
            ),
          ),
          Divider(
            thickness: 1.5,
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Text('Fit Details'),
              )),
          SizedBox(
            height: 20,
          ),
          _bulletPoints('100% Cotton'),
          SizedBox(
            height: 10,
          ),
          _bulletPoints('Total Body Length: Approx 25\"'),
          SizedBox(
            height: 20,
          ),
          Divider(
            thickness: _productTile ? 0 : 1.5,
          ),
          _expandedTitle(
              title: 'Product Description',
              func: (value) {
                setState(() {
                  if (_productTile) {
                    _productTile = false;
                  } else {
                    _productTile = true;
                  }
                });
              }),
          Divider(
            thickness: _productTile
                ? 0
                : _shippingTile
                    ? 0
                    : 1.5,
          ),
          _expandedTitle(
              title: 'Shipping',
              func: (value) {
                setState(() {
                  if (_shippingTile) {
                    _shippingTile = false;
                  } else {
                    _shippingTile = true;
                  }
                });
              }),
          Divider(
            thickness: _shippingTile
                ? 0
                : _reviewsTile
                    ? 0
                    : 1.5,
          ),
          ExpansionTile(
            onExpansionChanged: (value) {
              if (_reviewsTile) {
                _reviewsTile = false;
              } else {
                _reviewsTile = true;
              }
            },
            tilePadding: EdgeInsets.only(right: 17.0, left: 17.0),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product Reviews'),
                Row(
                  children: [
                    Center(
                        child: SmoothStarRating(
                      rating: rating,
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
                    Text(
                      '4.9',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    Text('(120)'),
                  ],
                ),
              ],
            ),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 17.0, right: 50.0, bottom: 20.0),
                child: Text(
                    'Nike Dri-FIT is  polyester fabric designed to help you keep dry so you can more comfortably work harder. longer. Read More'),
              ),
            ],
          ),
          Divider(
            thickness: _reviewsTile ? 0 : 1.5,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 17.0),
            child: Row(
              children: [
                Text(
                  'Customers Also Liked',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(5, (index) {
              return Container(
                margin: EdgeInsets.only(left: 17.0),
                height: 160,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              );
            })),
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      ),
    );
  }

  _expandedTitle({String title, Function func}) {
    return ExpansionTile(
      onExpansionChanged: func,
      tilePadding: EdgeInsets.only(right: 15, left: 17.0),
      title: Text(
        title,
      ),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 17.0, right: 50.0, bottom: 20.0),
          child: Text(
              'Nike Dri-FIT is  polyester fabric designed to help you keep dry so you can more comfortably work harder. longer. Read More'),
        ),
      ],
    );
  }

  _bulletPoints(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 17.0),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(30))),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  _selectColors(bool isClick, {Color color, Function func}) {
    return GestureDetector(
      onTap: func,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6.0, left: 2),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.check_circle,
                  size: 18,
                  color: Color(0xFFE6798A),
                )),
          ),
        ],
      ),
    );
  }

  _itemSize(String title, bool isClick, {Function func}) {
    return GestureDetector(
      onTap: func,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: isClick ? Color(0xFFE6798A) : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: !isClick
              ? Border.all(
                  width: 1,
                  color: Colors.grey //                   <--- border width here
                  )
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: TextStyle(
                    color: isClick ? Colors.white : Colors.black,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  _itemInfo() {
    return Container(
      margin: const EdgeInsets.only(left: 17.0, right: 17.0, top: 17.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Flexible Gym Pants',
                style: TextStyle(fontSize: 15),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      width: 1,
                      color: Colors
                          .grey //                   <--- border width here
                      ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
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
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '\$14.51',
                style: TextStyle(color: Color(0xFFE6798A), fontSize: 13),
              ),
              SizedBox(
                width: 20.w,
              ),
              Row(
                children: [
                  Text(
                    '\$8.23',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _littleSamplePhoto() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(
                width: 2,
                color: Colors.black //                   <--- border width here
                ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          height: 70,
          width: 70,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  _card({String title, String imageUrl}) {
    return Card(
      child: Row(
        children: [
          SizedBox(
            width: 20.w,
          ),
          Text(title),
          Spacer(),
          Container(
            height: 100.h,
            width: 180.w,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  _dateContainer(String value) {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(
        value,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Padding _item() {
    return Padding(
      padding: EdgeInsets.only(top: 20, right: 25.w, left: 25.w),
      child: Column(
        children: [
          Container(
            height: 500.h,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text('Flexible gym sweat pants | S - XL'),
              Spacer(),
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
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.0.w,
              top: 5.h,
            ),
            child: Row(
              children: [
                Text(
                  '\$14.51',
                  style: TextStyle(color: Color(0xFFE6798A), fontSize: 13),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Row(
                  children: [
                    Text(
                      '\$8.23',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough, fontSize: 12),
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
