import 'package:flutter/material.dart';
import 'package:quick_jot/const/images.dart';
import 'package:velocity_x/velocity_x.dart';

Widget applogo() {
  // using velocityX
  return Image.asset(appLogo)
      .box
      .transparent
      .size(180, 180)
      .margin(EdgeInsets.only(left: 25))
      .padding(EdgeInsets.all(8))
      .make();
}
