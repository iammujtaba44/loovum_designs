import 'dart:convert';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/services/models/home/ProductSlugModel.dart';
import 'package:loovum_designs/services/requestServices/RequestGetters.dart';
import 'package:loovum_designs/services/requestServices/constants.dart';
import 'package:loovum_designs/ui/screens/home/home_expired_product_page.dart';
import 'package:loovum_designs/ui/screens/home/home_tab_pages/sneak_peeks/sneak_peeks_dialog.dart';
import 'package:loovum_designs/ui/screens/home/store_profile/home_store_profile.dart';
import 'package:loovum_designs/ui/shared/widgets/CustomToast.dart';
import 'package:loovum_designs/ui/shared/widgets/appBar.dart';
import 'package:loovum_designs/ui/shared/widgets/pink_button.dart';
import 'package:loovum_designs/ui/shared/widgets/single_line_detail.dart';
import 'package:loovum_designs/ui/shared/widgets/slide_to_act.dart';
import 'package:loovum_designs/ui/shared/widgets/top_summary.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LiveProductPage extends StatefulWidget {
  final String slug;
  LiveProductPage({@required this.slug});
  @override
  _LiveProductPageState createState() => _LiveProductPageState();
}

class _LiveProductPageState extends State<LiveProductPage> {
  var rating = 3.0;
  bool isClick = false;
  bool xxl = false, xl = false, m = false, l = false;
  bool hasData = false;
  List<String> addItem = List<String>();
  String _dataImage = '';
  TextEditingController sizeCtr = TextEditingController();
  TextEditingController colorCtr = TextEditingController();
  TextEditingController quantityCtr = TextEditingController();
  int bagCount = 0;
  void initState() {
    // TODO: implement initState
    super.initState();
    getAddBags();
    getData();
  }

  getAddBags() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('list') != null) {
      print('----------list is not null');
      bagCount = prefs.getInt('count');
      addItem = prefs.getStringList('list');
    }
  }

  getData() async {
    bool result = await GetMethods.productSlugInit(slug: widget.slug);

    if (result) {
      if (mounted) {
        setState(() {
          hasData = true;
          _dataImage = Constants.productSlugModel.product.image;
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
    ScreenUtil.init(context, width: 750, height: 1334);
    var ScreenSize = MediaQuery.of(context).size;
    return !hasData
        ? Container(
            child: Center(
              child: SpinKitFadingFour(
                color: const Color(0xFFE6798A),
                size: 50.0,
              ),
            ),
          )
        : SafeArea(
            child: Column(
              children: [
                appBarWithIcon(
                    height: 120.h,
                    width: ScreenSize.width,
                    title: Constants.productSlugModel.product.title,
                    iconbtn: IconButton(
                        icon: Icon(Icons.keyboard_arrow_left_sharp,
                            color: Colors.black),
                        onPressed: null),
                    trailingIcon: Stack(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            onPressed: null),
                        bagCount == 0
                            ? SizedBox()
                            : Positioned(
                                right: 7,
                                top: 8,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0))),
                                  child: Text(
                                    '${bagCount}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                      ],
                    )),
                Stack(
                  children: [
                    Container(
                      height: 700.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://api.scentpeeks.com/${_dataImage}')),
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Text(
                            '1 of ${Constants.productSlugModel.product.galleries.length + 1}'),
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
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                        Constants.productSlugModel.product.galleries.length,
                        (index) {
                      return _littleSamplePhoto(
                          Constants.productSlugModel.product.galleries[index]);
                    }),
                    // children: [
                    //   _littleSamplePhoto(),
                    //   _littleSamplePhoto(),
                    //   _littleSamplePhoto(),
                    //   _littleSamplePhoto(),
                    //   _littleSamplePhoto(),
                    // ],
                  ),
                ),
                _itemInfo(),
                SizedBox(
                  height: 40.h,
                ),
                getFields(height: ScreenSize.height),
                SizedBox(
                  height: 30.h,
                ),
                getRow(height: ScreenSize.height, width: ScreenSize.width),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: 16.0,
                  ),
                  child: pinkButton(
                      height: 60.h,
                      width: double.infinity,
                      isRounded: true,
                      title: 'Add to Bag',
                      func: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        addItem.add(
                            json.encode(Constants.productSlugModel.product));

                        prefs.setStringList('list', addItem);
                        prefs.setInt('count', (bagCount + 1));
                        setState(() {
                          bagCount++;
                        });
                        prefs.get('list').forEach((element) {
                          print(element);
                        });
                        CustomToast(text: "Your order has been placed");
                      }),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                //   child: Row(
                //     children: [
                //       Text('Size'),
                //       Spacer(),
                //       Row(
                //           children: List.generate(4, (index) {
                //         return Row(
                //           children: [
                //             SizedBox(
                //               width: 10,
                //             ),
                //             _itemSize(
                //               '${Constants.productSlugModel.product.attributes[index].sku}',
                //               xxl,
                //               func: () {
                //                 setState(() {
                //                   xxl = !xxl;
                //                 });
                //               },
                //             ),
                //           ],
                //         );
                //       }))
                //     ],
                //   ),
                //
                //   // child: Row(
                //   //   children: [
                //   //     Text('Size'),
                //   //     Spacer(),
                //   //     SizedBox(
                //   //       width: 10.w,
                //   //     ),
                //   //     _itemSize(
                //   //       'XL',
                //   //       xl,
                //   //       func: () {
                //   //         setState(() {
                //   //           xl = !xl;
                //   //         });
                //   //       },
                //   //     ),
                //   //     SizedBox(
                //   //       width: 10.w,
                //   //     ),
                //   //     _itemSize(
                //   //       'M',
                //   //       m,
                //   //       func: () {
                //   //         setState(() {
                //   //           m = !m;
                //   //         });
                //   //       },
                //   //     ),
                //   //     SizedBox(
                //   //       width: 10.w,
                //   //     ),
                //   //     _itemSize(
                //   //       'L',
                //   //       l,
                //   //       func: () {
                //   //         setState(() {
                //   //           l = !l;
                //   //         });
                //   //       },
                //   //     )
                //   //   ],
                //   // ),
                // ),
                // Padding(
                //     padding:
                //         const EdgeInsets.only(left: 8.0, right: 8.0, top: 16),
                //     child: Row(
                //       children: [
                //         Text('Colors'),
                //         Spacer(),
                //         _selectColors(
                //           false,
                //           func: () {},
                //           color: Colors.grey,
                //         ),
                //         SizedBox(
                //           width: 10.w,
                //         ),
                //         _selectColors(false, func: () {}, color: Colors.black),
                //         SizedBox(
                //           width: 10.w,
                //         ),
                //         _selectColors(false,
                //             func: () {}, color: Color(0xFFB74FAF))
                //       ],
                //     )),
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
                        'LIVE',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                    width: double.infinity, height: .3, color: Colors.grey),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    topShortSummary(number: '46%', title: 'SAVED'),
                    topShortSummary(number: '00:00:00', title: 'TIME\'SUP'),
                    topShortSummary(
                        number:
                            '${Constants.productSlugModel.product.soldCount}',
                        title: 'SOLD'),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                    width: double.infinity, height: .3, color: Colors.grey),
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoreProfile(
                            sellerName:
                                Constants.productSlugModel.product.seller.slug,
                            sellerId: Constants
                                .productSlugModel.product.seller.id
                                .toString()
                                .trim(),
                          ),
                        ));
                  },
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xFF8589F7),
                  ),
                  title:
                      Text('${Constants.productSlugModel.product.seller.name}'),
                  subtitle: Row(
                    children: [
                      Center(
                          child: SmoothStarRating(
                        rating: Constants
                                .productSlugModel.product.seller.starCount /
                            Constants
                                .productSlugModel.product.seller.ratingCount,
                        isReadOnly: true,
                        size: 20,
                        color: Colors.yellow,
                        borderColor: Colors.yellow,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        defaultIconData: Icons.star_border,
                        starCount: 5,
                        allowHalfRating: true,
                        spacing: 2.0,
                        // onRated: (value) {
                        //   print("rating value -> $value");
                        //   // print("rating value dd -> ${value.truncate()}");
                        // },
                      )),
                      Text(
                          '(${Constants.productSlugModel.product.seller.starCount})'),
                    ],
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Container(
                    width: double.infinity, height: .3, color: Colors.grey),
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
                  height: 10,
                ),
                _bulletPoints(Constants.productSlugModel.product.fitDetails),
                SizedBox(
                  height: 10,
                ),
                _expandedTitle(
                  'Product Description',
                  text: Constants.productSlugModel.product.description,
                ),
                _expandedTitle('Shipping'),
                _expandedTitle('Fine Print'),
                ListTile(
                  onTap: () {
                    getSeller();
                  },
                  contentPadding: EdgeInsets.only(right: 15, left: 15),
                  trailing: Icon(Icons.keyboard_arrow_down_outlined),
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
                  // children: <Widget>[
                  //   Padding(
                  //     padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                  //     child: Text(
                  //         'Nike Dri-FIT is  polyester fabric designed to help you keep dry so you can more comfortably work harder. longer. Read More'),
                  //   ),
                  // ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Row(
                    children: [
                      Text(
                        'Customers Also Liked',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
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
                      crossAxisCount: 2,
                      childAspectRatio: 0.93,
                      mainAxisSpacing: 0),
                  itemCount: Constants.productSlugModel.similarProducts.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        _item2(
                            Constants.productSlugModel.similarProducts[index]),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 15.0,
                )
              ],
            ),
          );
  }

  getSeller() async {
    bool result = await GetMethods.sellerInit(
        sellerName: Constants.productSlugModel.product.seller.slug);

    // if (result) {
    //   if (mounted) {
    //     setState(() {
    //       hasData = true;
    //     });
    //   }
    // } else if (mounted) {
    //   setState(() {
    //     hasData = false;
    //   });
    // }
  }

  Padding _item2(SlugProduct data) {
    //print(data);
    return Padding(
        padding: EdgeInsets.only(
          top: 20,
          right: 15.w,
          left: 15.w,
        ),
        child: Column(children: [
          InkWell(
            onTap: () {
              if (data.activate == 1) {
                Navigator.pushReplacement(
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
                                ]))));
              } else {
                Navigator.pushReplacement(
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
                                ]))));
              }
            },
            child: Container(
              height: 250.h,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
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
                    '\$${data.salePrice}',
                    style: TextStyle(color: Color(0xFFE6798A), fontSize: 13),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    '\$${data.price}',
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
                      Text('${data.favCount}')
                    ],
                  )
                ],
              ),
            ],
          ),
        ]));
  }

  _expandedTitle(String title, {String text}) {
    return ExpansionTile(
      tilePadding: EdgeInsets.only(right: 15, left: 15),
      title: Text(
        title,
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 15.0, bottom: 10.0),
          child: text != null
              ? Html(data: text)
              : Text(
                  'Nike Dri-FIT is  polyester fabric designed to help you keep dry so you can more comfortably work harder. longer. Read More'),
        ),
      ],
    );
  }

  _bulletPoints(String title) {
    return title != null
        ? Html(data: title)
        : Text(
            title,
            style: TextStyle(color: Colors.grey),
          );
    // return Padding(
    //   padding: EdgeInsets.only(left: 15.0),
    //   child: Row(
    //     children: [
    //       Container(
    //         width: 5,
    //         height: 5,
    //         decoration: BoxDecoration(
    //             color: Colors.black,
    //             borderRadius: BorderRadius.all(Radius.circular(30))),
    //       ),
    //       SizedBox(
    //         width: 20,
    //       ),
    //       Text(title),
    //     ],
    //   ),
    // );
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
                Constants.productSlugModel.product.title,
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
                      Text(Constants.productSlugModel.product.favCount
                          .toString())
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
                '\$${Constants.productSlugModel.product.salePrice}',
                style: TextStyle(color: Color(0xFFE6798A), fontSize: 13),
              ),
              SizedBox(
                width: 20.w,
              ),
              Row(
                children: [
                  Text(
                    '\$${Constants.productSlugModel.product.price}',
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

  _littleSamplePhoto(Gallery data) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            // print(data.image);
            setState(() {
              if (_dataImage != data.image) {
                _dataImage = data.image;
              }
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                  width: 2,
                  color:
                      Colors.black //                   <--- border width here
                  ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: 70,
            width: 70,
          ),
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

  void getQuantitySheet({double height}) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, state) {
            return Container(
                height: height * 0.7,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 25.0, left: 40.0, bottom: 20.0),
                        child: Text(
                          'SELECT QUANTITY',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Divider(
                        thickness: 2.0,
                      ),
                      Expanded(
                        child: Container(
                          height: height * 0.5,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    quantityCtr.text = (index + 1).toString();
                                  });
                                  Navigator.pop(context);
                                },
                                splashColor: Colors.white10,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 25.0,
                                          left: 40.0,
                                          // bottom: 10.0
                                        ),
                                        child: Text(
                                          '${index + 1}',
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 40.0,
                                        ),
                                        child: Divider(
                                          thickness: 2.0,
                                        ),
                                      ),
                                    ]),
                              );
                            },
                          ),
                        ),
                      ),
                    ]));
          });
        });
  }

  void getSizeSheet({double height}) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, state) {
            return Container(
                height: height * 0.45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                )),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 25.0,
                          left: 40.0,
                        ),
                        child: Text(
                          'SIZE',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Divider(
                        thickness: 2.0,
                      ),
                      Expanded(
                        child: Container(
                          height: height * 0.3,
                          child: ListView.builder(
                            itemCount: Constants
                                .productSlugModel.product.attributes.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    sizeCtr.text = Constants.productSlugModel
                                        .product.attributes[index].sku
                                        .toUpperCase();
                                  });
                                  Navigator.pop(context);
                                },
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 25.0,
                                            left: 40.0,
                                            bottom: 10.0),
                                        child: Text(
                                          '${Constants.productSlugModel.product.attributes[index].sku.toUpperCase()}',
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 40.0,
                                        ),
                                        child: Divider(
                                          thickness: 2.0,
                                        ),
                                      ),
                                    ]),
                              );
                            },
                          ),
                        ),
                      ),
                    ]));
          });
        });
  }

  void getColorSheet({double height}) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, state) {
            return Container(
                height: height * 0.45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                )),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 25.0, left: 40.0, bottom: 20.0),
                        child: Text(
                          'Color',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Divider(
                        thickness: 2.0,
                      ),
                      Expanded(
                        child: Container(
                          height: height * 0.3,
                          child: ListView.builder(
                            itemCount: Constants
                                .productSlugModel.product.attributes.length,
                            itemBuilder: (context, index) {
                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 25.0,
                                        left: 40.0,
                                      ),
                                      child: Text(
                                        'color',
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 40.0,
                                      ),
                                      child: Divider(
                                        thickness: 2.0,
                                      ),
                                    ),
                                  ]);
                            },
                          ),
                        ),
                      ),
                    ]));
          });
        });
  }

  Widget getFields({double height}) {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          children: [
            TextFormField(
              readOnly: true,
              controller: sizeCtr,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  labelText: 'SIZE',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 20.0),
                  suffixIcon: InkWell(
                    onTap: () {
                      getSizeSheet(height: height);
                    },
                    child: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.grey,
                    ),
                  )),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              readOnly: true,
              controller: colorCtr,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  labelText: 'COLOR (SEE DESCRIPTION)',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 20.0),
                  suffixIcon: InkWell(
                    onTap: () {
                      getColorSheet(height: height);
                    },
                    child: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.grey,
                    ),
                  )),
            ),
          ],
        ));
  }

  Widget getRow({double height, double width}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(children: [
        Container(
          height: 60,
          width: 80,
          child: TextFormField(
            readOnly: true,
            controller: quantityCtr,
            style: TextStyle(fontSize: 15.0),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                hintText: '1',
                suffixIcon: InkWell(
                  onTap: () {
                    getQuantitySheet(height: height);
                  },
                  child: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.grey,
                  ),
                )),
          ),
        ),
        Expanded(
          child: Container(
            width: width * 0.8,
            height: 60,
            margin: EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                border: Border.all(width: 1.5)),
            child: MaterialButton(
              onPressed: () {
                _settingModalBottomSheet(context, addItem: addItem);
              },
              child: Text(
                'Buy now',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

void _settingModalBottomSheet(context, {List<String> addItem}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              child: new Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: [
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
                              singleLineDetail(
                                  title: 'ORDER SUBTOTAL',
                                  price:
                                      '\$${Constants.productSlugModel.product.salePrice}'),
                              SizedBox(
                                height: 5.h,
                              ),
                              singleLineDetail(
                                  title: 'Shipping',
                                  price:
                                      '\$${Constants.productSlugModel.product.shippingCharge}'),
                              SizedBox(
                                height: 5.h,
                              ),
                              singleLineDetail(
                                  title: 'Tax',
                                  price:
                                      '\$${Constants.productSlugModel.product.shippingChargeTwo}'),
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
                                    '\$${double.tryParse(Constants.productSlugModel.product.salePrice) + double.tryParse(Constants.productSlugModel.product.shippingCharge) + double.tryParse(Constants.productSlugModel.product.shippingChargeTwo)}',
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
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('SHIP TO...'),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
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
                      ],
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      final GlobalKey<SlideActionState> _key = GlobalKey();
                      return Padding(
                        padding: EdgeInsets.all(8.h),
                        child: SlideAction(
                          key: _key,
                          onSubmit: () async {
                            // SharedPreferences prefs =
                            //     await SharedPreferences.getInstance();
                            //
                            // addItem.add(json
                            //     .encode(Constants.productSlugModel.product));
                            //
                            // prefs.setStringList('list', addItem);
                            //
                            // prefs.get('list').forEach((element) {
                            //   print(element);
                            // });
                            CustomToast(text: "Your order has been placed");
                            //   print(prefs.get('list'));
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
