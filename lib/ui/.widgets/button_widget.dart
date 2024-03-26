import 'package:flutter/material.dart';

Widget myButtonWidget(
    {required String label,
    required void Function() onPressed,
    Color bg = Colors.white,
    Color fg = Colors.white,
    double size = 24}) {
  return Expanded(
    flex: 5,
    child: MaterialButton(
      onPressed: onPressed,
      height: 60,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color:const Color.fromRGBO(28, 38, 49, 1),
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: fg, fontSize: size),
        ),
      ),
    ),
  );
}
