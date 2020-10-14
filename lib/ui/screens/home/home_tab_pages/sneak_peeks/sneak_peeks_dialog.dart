import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loovum_designs/ui/shared/widgets/pink_button.dart';

class ExitConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
    height: 300,
    width: 320,
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(12))
    ),
    child: Column(

      children: <Widget>[
        SizedBox(height: 20.h,),
        Text(
          'SNEAK PEEKS',
          style: TextStyle(letterSpacing: 4, color: Colors.grey),
        ),
        SizedBox(height: 20.h,),
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
         Container(height: 2.h, width: 70.w, color: Colors.grey,),
         SizedBox(width: 5,),
         Text('WHAT ARE SNEAK PEEKS?', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),),
         SizedBox(width: 5,),
         Container(height: 2.h, width: 70.w, color: Colors.grey,),
       ],),
        SizedBox(height: 30.h,),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Text('Tomorrow\'s products will now be revealed every day at 2:00 pm ET. Just another way we make shopping easier.', style: TextStyle(color: Colors.grey), textAlign: TextAlign.center,),
        ),
        SizedBox(height: 40.2,),
        pinkButton(height: 60.h, width: 500.w, isRounded: true, title: 'Add to Bag', func: () {
                  print('hello I\'m alive');
                }),
                Spacer(),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 61.0, left: 0.1),
              child: Container(

                decoration: BoxDecoration(
                    color: Color(0xFF97DCD2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(12))
                ), height: 40.77, width: 320,),
            ),
            Container(
              child: Image.asset('assets/images/dialog_image2.png', ),
              width: double.infinity,

            ),
            Padding(
              padding: const EdgeInsets.only(top:24.0),
              child: Container(
                child: Image.asset('assets/images/dialog_image1.png', ),
                width: double.infinity,

              ),
            ),
          ],
        )
      ],
    ),
  );
}

