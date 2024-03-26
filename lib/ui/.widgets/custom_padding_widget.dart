import 'package:flutter/material.dart';

Widget myCustomPaddingWidget({
  required Widget child,
  double horPadding = 0,
  double verPadding = 0,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: horPadding,
      vertical: verPadding,
    ),
    child: child,
  );
}
