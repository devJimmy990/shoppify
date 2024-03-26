import 'package:flutter/material.dart';

Widget myCustomContainer({
  required Widget child,
  Color? bgColor,
  double? height,
  AlignmentGeometry? align,
  double horPadding = 0,
  double verPadding = 0,
  double horMargin = 0,
  double verMargin = 0,
  double radius = 25,
}) =>
    Container(
      alignment: align,
      margin:  EdgeInsets.symmetric(horizontal: horMargin, vertical: verMargin),
      padding:  EdgeInsets.symmetric(horizontal: horPadding, vertical: verPadding),
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
