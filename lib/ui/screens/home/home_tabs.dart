import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/screens/home/home_tab_pages/favourites_2_page.dart';
import 'package:loovum_designs/ui/screens/home/home_tab_pages/favourites_page.dart';
import 'package:loovum_designs/ui/screens/home/home_tab_pages/products_page.dart';
import 'package:loovum_designs/ui/screens/home/home_tab_pages/sneak_peeks/sneak_peeks_page.dart';
import 'package:loovum_designs/ui/shared/widgets/appBar.dart';

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
      home: HomeTabs(),
    );
  }
}

class HomeTabs extends StatefulWidget {
  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[400],
              indicatorColor: Color(0xFFE6798A),
              tabs: [
                Tab(
                    child: Text(
                  'Products',
                )),
                Tab(child: Text('Sneak Peeks')),
                Tab(child: Text('Favourites')),
              ],
            ),
            title: Image.asset(
              'assets/images/logo.png',
            ),
          ),
          body: TabBarView(
            children: [
              ProductsPage(),
              SneakPeeksPage(),
              FavouritesPage(),
            ],
          ),
        ),
      ),
    );
  }
}
