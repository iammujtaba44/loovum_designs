import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loovum_designs/services/models/MainHomeModel.dart';
import 'package:loovum_designs/services/models/search/EndingSoon.dart';
import 'package:loovum_designs/services/models/search/PopularModel.dart';
import 'package:loovum_designs/services/requestServices/RequestGetters.dart';
import 'package:loovum_designs/services/requestServices/constants.dart';
import 'package:loovum_designs/ui/screens/home/home_expired_product_page.dart';
import 'package:loovum_designs/ui/shared/widgets/appBar.dart';

void main() {
  runApp(MyApp());
}

class SneakPeak2 extends StatefulWidget {
  final String title;
  final bool type;

  SneakPeak2({@required this.title, @required this.type});

  @override
  _SneakPeak2State createState() => _SneakPeak2State();
}

class _SneakPeak2State extends State<SneakPeak2> {
  bool hasData = false;
  @override
  void initState() {
    super.initState();
    if (widget.type)
      getPopularData();
    else
      getEndingData();
  }

  getPopularData() async {
    print('OKKa');
    bool result = await GetMethods.popularInit();
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
    // print(Constants.popularModel.data[0]);
  }

  getEndingData() async {
    print('OKKa2');
    bool result = await GetMethods.endingSoonInit();
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
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    var ScreenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: !hasData
              ? Container(
                  child: Center(
                  child: SpinKitFadingFour(
                    color: const Color(0xFFE6798A),
                    size: 50.0,
                  ),
                ))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      appBar(
                          height: ScreenSize.height * 0.09,
                          width: ScreenSize.width,
                          title: '${widget.title}'),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Center(
                            child: Text(
                          '${widget.title}',
                          style: TextStyle(fontSize: 25.0),
                        )),
                      ),

                      SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                              widget.type
                                  ? Constants.popularModel.total
                                  : Constants.endingSoonModel.total, (index) {
                            return widget.type
                                ? _itemPopular(
                                    Constants.popularModel.data[index])
                                : _itemEnding(
                                    Constants.endingSoonModel.data[index]);
                          }),
                        ),
                      ),
                      // ListView.builder(
                      //     itemCount: widget.type
                      //         ? Constants.popularModel.total
                      //         : Constants.endingSoonModel.total,
                      //     itemBuilder: (context, index) {
                      //       return widget.type
                      //           ? _itemPopular(Constants.popularModel.data[index])
                      //           : _itemEnding(
                      //               Constants.endingSoonModel.data[index]);
                      //     }),
                    ],
                  ),
                )),
    );
  }

  Padding _itemEnding(EndingSoonData data) {
    var ScreenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 35, right: 18, left: 18),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => Scaffold(
              //           body: ListView(
              //               physics: BouncingScrollPhysics(),
              //               padding: EdgeInsets.all(0),
              //               children: [ExpiredProductPage()]))),
              // );
            },
            child: Container(
              height: ScreenSize.height * 0.57,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Image.network(
                'https://api.scentpeeks.com/storage/banner/1604762439_5fa6bb47c25ce.png',
                fit: BoxFit.cover,
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
                  Icon(
                    Icons.favorite_border,
                    size: 19,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '${data.favCount}',
                    style: TextStyle(color: Colors.grey),
                  )
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

  Padding _itemPopular(Dater data) {
    var ScreenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 35, right: 18, left: 18),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => Scaffold(
              //           body: ListView(
              //               physics: BouncingScrollPhysics(),
              //               padding: EdgeInsets.all(0),
              //               children: [ExpiredProductPage()]))),
              // );
            },
            child: Container(
              height: ScreenSize.height * 0.57,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Image.network(
                'https://api.scentpeeks.com/storage/banner/1604762439_5fa6bb47c25ce.png',
                fit: BoxFit.cover,
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
                  Icon(
                    Icons.favorite_border,
                    size: 19,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '${data.favCount}',
                    style: TextStyle(color: Colors.grey),
                  )
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
