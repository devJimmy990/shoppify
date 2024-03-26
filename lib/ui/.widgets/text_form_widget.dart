import 'package:flutter/material.dart';

Widget myTextForm({
  required String hint,
  TextEditingController? controller,
  Widget? icon,
  Icon? preIcon,
  bool isNum = false,
  bool isPass = false,
  bool isVisible = false,
  Color color = Colors.black,
  Color fillColor = Colors.white,
  Color hintColor = Colors.black54,
  Color? cursorColor,
  int? maxLines,
  int? minLines,
  double size = 18,
}) =>
    TextFormField(
      controller: controller,
      obscureText: isPass ? !isVisible : false,
      cursorColor: cursorColor,
      style: TextStyle(color: color, fontSize: size),
      keyboardType: isNum ? TextInputType.number : TextInputType.text,
      textInputAction: TextInputAction.newline,
      textAlignVertical:TextAlignVertical.center ,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        hintText: hint,

        hintStyle: TextStyle(color: hintColor),

        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
        suffixIcon: isPass ? icon : null,
        prefixIcon: preIcon,
      ),
    );
