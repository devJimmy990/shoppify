import 'package:flutter/material.dart';

Widget myTextWidget({
  int maxLine = 3,
  double size = 18,
  double letSpace = 1,
  required String label,
  bool isItalic = false,
  Color color = Colors.black,
  TextAlign align = TextAlign.start,
  FontWeight weight = FontWeight.normal
}) =>
    Text(
      label,
      maxLines: maxLine,
      textAlign: align,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
        fontWeight: weight,
        letterSpacing: letSpace,
      ),
    );
