import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/screens/home/home_tab_pages/sneak_peeks/sneak_peeks_dialog.dart';
import 'package:loovum_designs/ui/shared/widgets/appBar.dart';
import 'package:loovum_designs/ui/shared/widgets/pink_button.dart';
import 'package:loovum_designs/ui/shared/widgets/single_line_detail.dart';
import 'package:loovum_designs/ui/shared/widgets/slide_to_act.dart';
import 'package:loovum_designs/ui/shared/widgets/top_summary.dart';
import 'package:preview/preview.dart';
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
              children: [LiveProductPage()])),
    );
  }
}

class LiveProductPage extends StatefulWidget {
  @override
  _LiveProductPageState createState() => _LiveProductPageState();
}

class _LiveProductPageState extends State<LiveProductPage> {
  var rating = 3.0;
  bool isClick = false;
  bool xxl = false, xl = false, m = false, l = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Column(
      children: [
        appBar(height: 120.h, width: 750.w, title: 'Flexible Gym Pants'),
        Stack(
          children: [
            Container(
              color: Colors.grey,
              height: 700.h,
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _littleSamplePhoto(),
              _littleSamplePhoto(),
              _littleSamplePhoto(),
              _littleSamplePhoto(),
              _littleSamplePhoto(),
            ],
          ),
        ),
        _itemInfo(),
        SizedBox(
          height: 40.h,
        ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0,),
                child: pinkButton(height: 60.h, width: double.infinity, isRounded: true, title: 'Add to Bag', func: () {
                  _settingModalBottomSheet(context);
                }),
              ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Row(
            children: [
              Text('Size'),
              Spacer(),
              SizedBox(
                width: 10.w,
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
                width: 10.w,
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
                width: 10.w,
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
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16),
            child: Row(
              children: [
                Text('Colors'),
                Spacer(),
                _selectColors(
                  false,
                  func: () {},
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10.w,
                ),
                _selectColors(false, func: () {}, color: Colors.black),
                SizedBox(
                  width: 10.w,
                ),
                _selectColors(false, func: () {}, color: Color(0xFFB74FAF))
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(
              left: 8.0, right: 15.0, top: 8.0, bottom: 8.0),
          child: SizedBox(
            width: double.infinity,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: BorderSide(color: Colors.grey)),
              child: Text(
                'LIVE'   ,
                style: TextStyle(color: Colors.grey[600]),
              ),
              onPressed: () {},
            ),
          ),
        ),
        Container(width: double.infinity, height: .3, color: Colors.grey),
        SizedBox(
          height: 10.h,
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
          height: 10.h,
        ),
        Container(width: double.infinity, height: .3, color: Colors.grey),
        SizedBox(
          height: 10.h,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Sold By'),
            )),
        ListTile(
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
            child: Icon(Icons.arrow_forward_ios),
          ),
        ),
        Container(width: double.infinity, height: .3, color: Colors.grey),
        SizedBox(
          height: 10.h,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Fit Details'),
            )),
        SizedBox(
          height: 20.h,
        ),
        _bulletPoints('100% Cotton'),
        _bulletPoints('Total Body Length: Approx 25\"'),
        SizedBox(
          height: 15,
        ),
        _expandedTitle('Product Description'),
        _expandedTitle('Shipping'),
        _expandedTitle('Fine Print'),
        ExpansionTile(
          tilePadding: EdgeInsets.only(right: 15, left: 15),
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
            Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 15.0),
              child: Text(
                  'Nike Dri-FIT is  polyester fabric designed to help you keep dry so you can more comfortably work harder. longer. Read More'),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
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
          height: 20,
        ),
         GridView.builder(
           shrinkWrap: true,
           physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2, childAspectRatio: 0.93, mainAxisSpacing: 5),
          itemCount: 4 ,
          itemBuilder: (context, index) {
         return Column(
           children: [
             _item(),

             
           ],
         );
          },
        ),
        // ListView(
        //   shrinkWrap: true,
       
        //           children: [ Column(
        //     children: [
        //       SizedBox(
        //         width: 15,
        //       ),
        //       Container( 
        //         height: 200.h,
        //         width: 300.w,
        //         decoration: BoxDecoration(
        //           color: Colors.grey,
        //           borderRadius: BorderRadius.all(Radius.circular(10)),
        //         ),
        //       ),
        //       SizedBox(
        //         width: 15,
        //       ),
        //       Container(
        //         height: 200.h,
        //         width: 300.w,
        //         decoration: BoxDecoration(
        //           color: Colors.grey,
        //           borderRadius: BorderRadius.all(Radius.circular(10)),
        //         ),
        //       ),
        //        SizedBox(
        //         width: 15,
        //       ),
        //       Container(
        //         height: 200.h,
        //         width: 300.w,
        //         decoration: BoxDecoration(
        //           color: Colors.grey,
        //           borderRadius: BorderRadius.all(Radius.circular(10)),
        //         ),
        //       ),
        //     ],
        //   ),]
        // ),

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
            height: 250.h,
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

  _expandedTitle(String title) {
    return ExpansionTile(
      tilePadding: EdgeInsets.only(right: 15, left: 15),
      title: Text(
        title,
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 15.0),
          child: Text(
              'Nike Dri-FIT is  polyester fabric designed to help you keep dry so you can more comfortably work harder. longer. Read More'),
        ),
      ],
    );
  }

  _bulletPoints(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
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
          Text(title),
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
            padding: EdgeInsets.only(top: 6.0, left: 4),
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
                  size: 17,
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: Row(
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
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20.0.w,
            top: 1.h,
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
                ],
              ),
            ],
          ),
        ),
      ],
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
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              child: new Column(
                children: <Widget>[
                  Expanded(
                                      child: ListView(children: [
                      Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('3/22 / Style 4'),
                              Spacer(),
                              Text('1'),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                        singleLineDetail(title: 'ORDER SUBTOTAL', price: '\$0.00' ),
                          
                          SizedBox(
                            height: 5.h,
                          ),
                          singleLineDetail(title: 'ORDER SUBTOTAL', price: '\$0.00' ),
                          SizedBox(
                            height: 5.h,
                          ),
                          singleLineDetail(title: 'ORDER SUBTOTAL', price: '\$0.00' ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Text(
                                'ORDER TOTAL',
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              Text(
                                '\$23.21',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Container(
                          color: Colors.grey[300],
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Padding(
                                padding:  EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('SHIP TO...'),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: Text(
                                          'Orkhan Rasulov (default) - 409 Summerbrook Dr Alanta, GA 30350'),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text('PAY WITH...'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: Text(
                                          'Orkhan Rasulov (default) - Ending 1869'),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    ],),
                  ),
                  Builder(
                    builder: (context) {
                      final GlobalKey<SlideActionState> _key = GlobalKey();
                      return Padding(
                        padding: EdgeInsets.all(8.h),
                        child: SlideAction(
                          key: _key,
                          onSubmit: () {
                            Future.delayed(
                              Duration(seconds: 1),
                              () => _key.currentState.reset(),
                            );
                          },
                          reversed: false,
                          sliderButtonYOffset: -7,
                          text: 'SLIDE TO PLACE ORDER',
                          height: 60,
                          elevation: 0,
                          innerColor: Color(0xFFE6798A),
                          outerColor: Colors.grey[300],
                          borderRadius: 5,
                          animationDuration: Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
               
                ],
              ),
            );
          },
        );
      });
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
