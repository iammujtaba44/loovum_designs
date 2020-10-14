import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/screens/blog/blog_screen.dart';
import 'package:loovum_designs/ui/screens/home/home_tabs.dart';
import 'package:loovum_designs/ui/screens/more/orderHistory1_Screen.dart';
import 'package:loovum_designs/ui/screens/search/search_page.dart';
import 'package:loovum_designs/ui/screens/shoppingBag/shoppingBag_Screen.dart';
import 'package:loovum_designs/ui/shared/widgets/appBar.dart';
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
      home: Home(),
    
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PageController pageController;

  int pageIndex = 0;

   onTapChangedPage(int pageIndex) {
    pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 300), curve: Curves.bounceInOut);
  }

   onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          
          HomeTabs(),
          SearchPage(),
          BlogScreen(),
          ShoppingBagScreen(),
         OrderHistory1(),
          
         
        ],
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
      ), 
      
      bottomNavigationBar:  CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/home_black.png'), )),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/search_icon.png'), )),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/middle_icon2.png'), )),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/shopping_bag.png'), )),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/more_icon.png'), )),
        ],
        currentIndex: pageIndex,
        activeColor: Colors.black,
        inactiveColor: Color(0xFFC3C1C1),
        backgroundColor: Colors.white, 
        onTap: onTapChangedPage,
      ),);
  }

  void dispose() {
    super.dispose();
    pageController.dispose();
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