import 'package:flutter/cupertino.dart';

int getScreenHeight(BuildContext context) {
  var ScreenHeight = MediaQuery.of(context).size.height;

  if (ScreenHeight > 650 && ScreenHeight < 750)
    return 0;
  else if (ScreenHeight > 750 && ScreenHeight < 800)
    return 1;
  else
    return 2;
}
