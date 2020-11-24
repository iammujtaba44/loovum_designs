import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loovum_designs/services/models/blog/BlogCatModel.dart';
import 'package:loovum_designs/services/requestServices/RequestGetters.dart';
import 'package:loovum_designs/services/requestServices/constants.dart';
import 'package:loovum_designs/ui/shared/roundedButton.dart';
import 'package:loovum_designs/ui/shared/widgets/appBar.dart';
import 'package:http/http.dart' as http;

class BlogScreen extends StatefulWidget {
  @override
  BlogScreenState createState() => BlogScreenState();
}

class BlogScreenState extends State<BlogScreen> {
  List<String> _values = []
    ..add("Fashion & Beauty")
    ..add("wellness")
    ..add("Teck Backgrounds")
    ..add("Travel");

  List<String> _labels = []
    ..add("WELLNESS")
    ..add("Teck Backgrounds")
    ..add("Travel");
  List<String> _body = []
    ..add("The 5 Best Exercises To Do If You \nAre Feeling Lazy")
    ..add("Free Downloadable Tech \nBackgrounds For 2020!")
    ..add("5 Lessons I have learned From \nTravelling Alone.s");
  List data;
  bool hasData = false;
  bool hasDataCat = false;
  bool hasDataCat1 = false;
  getData() async {
    var response =
        await http.get('https://api.scentpeeks.com/api/blog/homepage');

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      //print(jsonDecode(map)['welcomePosts'].length);

      if (mounted) {
        setState(() {
          data = jsonDecode(map)['welcomePosts'];
          // hasData = true;
        });
      }

      // print(data[0]['category_name']);
      // Map d = data[0];
      //  print(d);
      // return ordersModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  getBlogList() async {
    bool result = await GetMethods.blogRequiredInit();

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

  getDataCat({String slug}) async {
    bool result = await GetMethods.blogCatInit(slug: slug);

    if (result) {
      if (mounted) {
        setState(() {
          hasDataCat1 = true;
        });
      }
    } else if (mounted) {
      setState(() {
        hasDataCat1 = false;
      });
    }
  }

  void initState() {
    super.initState();
    getBlogList();
    getData();
  }

  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context).size;
    print(ScreenSize);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              appBar(
                  width: ScreenSize.width,
                  height: ScreenSize.height * 0.17,
                  title: "Blog"),
              !hasData
                  ? Container(
                      margin: EdgeInsets.all(17.0),
                      child: Center(
                        child: SpinKitFadingFour(
                          color: const Color(0xFFE6798A),
                          size: 50.0,
                        ),
                      ))
                  : _horizList(),
              data == null
                  ? Container(
                      margin: EdgeInsets.all(17.0),
                      height: ScreenSize.height * 0.57,
                      child: Center(
                        child: SpinKitFadingFour(
                          color: const Color(0xFFE6798A),
                          size: 50.0,
                        ),
                      ))
                  : !hasDataCat
                      ? _bodyList()
                      : !hasDataCat1
                          ? Container(
                              margin: EdgeInsets.all(17.0),
                              height: ScreenSize.height * 0.57,
                              child: Center(
                                child: SpinKitFadingFour(
                                  color: const Color(0xFFE6798A),
                                  size: 50.0,
                                ),
                              ))
                          : _bodyCatList(),
              _container(),
              _textContainer("6 Ways To Dye Cloths At Home"),
              _container(),
              _textContainer("Sneakers: The Staple Items We Just Can’t Quit"),
              _getDeviderText("SHOP"),
              _gridViewContainer(),
              _hugeContainer(),
              _getDeviderText("LATEST STORIES"),
              //  _bodyList(),
            ],
          ),
        ),
      ),
    );
  }

  _textContainer(String _label) {
    return Container(
        margin: EdgeInsets.only(left: 17.0),
        alignment: Alignment.centerLeft,
        child: Text(_label));
  }

  _bodyList() {
    return SingleChildScrollView(
        child: Column(
      children: List.generate(data.length, (index) {
        return _bodyContainer(datum: data[index]);
      }),
    ));
  }

  _bodyContainer({Map datum}) {
    var ScreenSize = MediaQuery.of(context).size;
    MediaQueryData device = MediaQuery.of(context);
    return Container(
        margin: EdgeInsets.all(17.0),
        height: ScreenSize.height * 0.57,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: const Color(0xFFF8F8F8),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        //   border: Border.all(color: Colors.grey)),
        child: Stack(
          children: [
            Column(children: [
              Container(
                //  margin:  EdgeInsets.all(10.0),
                height: ScreenSize.height * 0.45,

                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              SizedBox(
                height: ScreenSize.height * 0.04,
              ),
              Text(
                datum['title'],
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: device.textScaleFactor * 16),
                textAlign: TextAlign.center,
              )
            ]),
            Padding(
                padding: EdgeInsets.only(top: ScreenSize.height * 0.33),
                child: Center(
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 7.0, horizontal: 30.0),
                        color: const Color(0xFFFDD0D7),
                        child: Text(datum['category_name'],
                            style: TextStyle(fontWeight: FontWeight.w400))))),
          ],
        ));
  }

  _bodyCatList() {
    return SingleChildScrollView(
        child: Column(
      children:
          List.generate(Constants.blogCatModel.posts.data.length, (index) {
        return _bodyContainerCat(
            datum: Constants.blogCatModel.posts.data[index]);
      }),
    ));
  }

  _bodyContainerCat({CatData datum}) {
    var ScreenSize = MediaQuery.of(context).size;
    MediaQueryData device = MediaQuery.of(context);
    return Container(
        margin: EdgeInsets.all(17.0),
        height: ScreenSize.height * 0.57,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: const Color(0xFFF8F8F8),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        //   border: Border.all(color: Colors.grey)),
        child: Stack(
          children: [
            Column(children: [
              Container(
                //  margin:  EdgeInsets.all(10.0),
                height: ScreenSize.height * 0.45,

                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              SizedBox(
                height: ScreenSize.height * 0.04,
              ),
              Text(
                datum.title,
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: device.textScaleFactor * 16),
                textAlign: TextAlign.center,
              )
            ]),
            Padding(
                padding: EdgeInsets.only(top: ScreenSize.height * 0.33),
                child: Center(
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 7.0, horizontal: 30.0),
                        color: const Color(0xFFFDD0D7),
                        child: Text(datum.categoryName,
                            style: TextStyle(fontWeight: FontWeight.w400))))),
          ],
        ));
  }

  _hugeContainer() {
    var ScreenSize = MediaQuery.of(context).size;
    MediaQueryData device = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.all(17.0),
      height: ScreenSize.height * 1.0,
      decoration: BoxDecoration(
          color: Colors.black, //const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        children: [
          Container(
            // alignment: Alignment.bottomCenter,
            height: ScreenSize.height * 0.4,
            width: ScreenSize.width,

            decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0))),

            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("TRAVEL"),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "5 Lessons I have learned From \nTravelling Alone.",
                      style: TextStyle(
                          fontSize: ScreenSize.width * 0.05,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                        "I went on my first solo trip when I was 22. Growing up going on\n mission trips of 30+ high school students who were probably…",
                        style: TextStyle(fontSize: ScreenSize.width * 0.029)),
                    SizedBox(
                      height: 32.0,
                    ),
                    Center(
                      child: RoundedButton(
                          ScreenSize.width * 0.7,
                          60,
                          'Continue Reading',
                          2.0,
                          TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.w500)),
                    ),
                  ]),
            ),
          ),
          Container(
            // alignment: Alignment.bottomCenter,
            height: ScreenSize.height * 0.6,

            decoration: BoxDecoration(
                color: Colors.grey[800], //const Color(0xFFF8F8F8),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0))),
          ),
        ],
      ),
    );
  }

  _getDeviderText(String _label) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(children: <Widget>[
        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 18.0, right: 20.0),
              child: Divider(
                color: Colors.black,
                height: 36,
              )),
        ),
        Text(
          _label,
          style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 3.0),
        ),
        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 20.0, right: 18.0),
              child: Divider(
                color: Colors.black,
                height: 36,
              )),
        ),
      ]),
    );
  }

  _gridViewContainer() {
    var ScreenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 17.0),
      height: ScreenSize.height > 650 && ScreenSize.height < 750
          ? ScreenSize.height * 0.7
          : ScreenSize.height * 0.57,
      child: GridView.count(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        mainAxisSpacing: 35.0,
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        children: List.generate(4, (index) {
          return _items();
        }),
      ),
    );
  }

  _items() {
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
            Text(
              "Body Scent Oils",
              style: TextStyle(fontSize: ScreenSize.width * 0.04),
            ),
            Spacer(),
            Icon(
              Icons.favorite_border,
              size: ScreenSize.width * 0.05,
            ),
            SizedBox(width: 5.0),
            Text('503', style: TextStyle(fontSize: ScreenSize.width * 0.04))
          ],
        ),
        SizedBox(
          height: 6.0,
        ),
        Row(
          children: [
            Text(
              '\$14.51',
              style: TextStyle(
                  color: Color(0xFFE6798A), fontSize: ScreenSize.width * 0.04),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              '\$8.23',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: ScreenSize.width * 0.04),
            ),
          ],
        ),
      ],
    );
  }

  var selectedbtn;
  _horizList() {
    var ScreenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(Constants.blogRequiredModel.categories.length,
              (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  if (selectedbtn == index) {
                    selectedbtn = null;
                    hasDataCat = false;
                    hasDataCat1 = false;
                    data = null;
                    getData();
                  } else {
                    selectedbtn = index;
                    hasDataCat1 = false;
                    getDataCat(
                        slug:
                            Constants.blogRequiredModel.categories[index].slug);
                    hasDataCat = true;
                    // print(Constants.blogRequiredModel.categories[index].slug);
                  }
                });
              },
              child: Container(
                margin: index == 0
                    ? const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 18.0)
                    : const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 10.0),
                // padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 15.0, left: 32.0, right: 32.0),
                alignment: Alignment.center,
                //  width: ScreenSize.width * 0.37,
                //  height: ScreenSize.height * 0.01,
                decoration: BoxDecoration(
                    color: selectedbtn == index
                        ? Color(0xFFE6798A)
                        : Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    border: Border.all(color: Colors.grey)),
                child: Text(
                  Constants.blogRequiredModel.categories[index].name,
                  style: TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.w500,
                      color:
                          selectedbtn == index ? Colors.white : Colors.black),
                ),
              ),
            );
          }),
        ));
  }

  _container() {
    var ScreenSize = MediaQuery.of(context).size;
    MediaQueryData device = MediaQuery.of(context);

    return Container(
      margin: EdgeInsets.all(17.0),
      height: ScreenSize.height * 0.4,
      decoration: BoxDecoration(
          color: Colors.grey, //const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );
  }
}
