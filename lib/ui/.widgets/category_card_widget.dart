import 'package:flutter/material.dart';
import '../../model/category.dart';
import '../.widgets/custom_container_widget.dart';
import '../.widgets/text_widget_widget.dart';

Widget myCategoryCard({required KCategory category}) {
  return myCustomContainer(
    horMargin: 5,
    verPadding: 3,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset(
          category.image,
          width: 75,
          height: 75,
        ),
        myTextWidget(
          label: category.name,
          size: 15,
          color: Colors.indigo,
          weight: FontWeight.w500,
        ),
      ],
    ),
  );
}
