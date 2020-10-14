import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

storeRatingWidget(BuildContext context, {String type, String numOfRates}) {
  ScreenUtil.init(context, width: 750, height: 1334);
  var ScreenSize = MediaQuery.of(context).size;
  return Container(
    // padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
    child: Row(
      //  mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(type),
        SizedBox(width: 10.0),
        Stack(
          children: [
            Container(
                height: 30.h,
                width: ScreenSize.width * 0.7,
                color: Colors.grey[300]),
            Container(height: 30.h, width: 300.w, color: Color(0xFFE6798A)),
          ],
        ),
        SizedBox(width: 10.0),
        Text(numOfRates),
      ],
    ),
  );
}
