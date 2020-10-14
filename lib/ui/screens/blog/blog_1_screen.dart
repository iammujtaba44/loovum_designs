import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loovum_designs/ui/shared/widgets/appBar.dart';

class Blog_1_Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Blog_1_ScreenState();
  }
}

class Blog_1_ScreenState extends State<Blog_1_Screen> {
  List<String> _values = []
    ..add("Fashion")
    ..add("Popular")
    ..add("Perfumes")
    ..add("Travel");

  List<String> _labels = []
    ..add("WELLNESS")
    ..add("Teck Backgrounds")
    ..add("Travel");
  List<String> _body = []
    ..add("The 5 Best Exercises To Do If You \nAre Feeling Lazy")
    ..add("Free Downloadable Tech \nBackgrounds For 2020!")
    ..add("5 Lessons I have learned From \nTravelling Alone.s");
  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBar(
                width: ScreenSize.width,
                height: ScreenSize.height * 0.17,
                title: "The 5 Best Excersises…"),
            _horizList(),
            _firstRow(),
            _bodyContainer(),
            _bodyText(),
             _bodyContainer(),
             _bodyText2(),
             _getDeviderText('RELATED PRODUCTS'),
             _gridViewContainer()
                
          ],
        ),
      ),
    );
  }
     _bodyText2()
     {
       return Container(
          margin: EdgeInsets.symmetric( horizontal:17.0,),
         child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
           children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                 Text('Loovum Fitness'),
                 Text('SHOP NOW',style: TextStyle(color: const Color(0xFFE6798A)),)

              ],
            ),
            SizedBox(height: 5.0,),
            Text('Pair of 2kg Dumbells',style:TextStyle(fontWeight: FontWeight.w600, fontSize: 22.0))
         ],),
       );
     }
    _bodyText()
    {
      return Container(
          margin: EdgeInsets.all(17.0),
        child: Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod. tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.'
'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna.',style: TextStyle(color:Colors.grey[700]),),
      
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
 _bodyContainer()
 {
   var ScreenSize = MediaQuery.of(context).size;
   return   Container(
                  margin: EdgeInsets.all(17.0),
                height: ScreenSize.height * 0.55,

                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              );
           
 }
  _firstRow()
  {
    return Container(
      margin: const EdgeInsets.only(top: 30.0, bottom: 10.0, left: 18.0),
        child: Column(
          children: [
           Row(
             children: <Widget>[
               Text('WELLNESS'),
               Text('  /  '),
               Text('23 Mar, 2020',style: TextStyle(color: Colors.grey),)
             ],
           ),
           SizedBox(height: 10.0,),
            Row(
              children: <Widget>[
                  Text('Written By'),
               
               Text(' Orkhan Rasulov',style: TextStyle(fontWeight: FontWeight.w500),)
            
              ],
            )
          ]
        ),
    );
  }

  _horizList() {
    var ScreenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(_values.length, (index) {
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
                _values[index],
                style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w500),
              ),
            );
          }),
        ));
  }

  _gridViewContainer() {
    var ScreenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 17.0),
      height: ScreenSize.height * 0.7,
      child: GridView.count(
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

}
