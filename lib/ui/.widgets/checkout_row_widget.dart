import 'package:flutter/material.dart';
import '../../model/item.dart';
import '../.widgets/custom_padding_widget.dart';
import '../.widgets/text_widget_widget.dart';

Widget myCheckoutRow({required KItem item}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      myCustomPaddingWidget(
        verPadding: 5,
        child: myTextWidget(label: item.id),
      ),
      myCustomPaddingWidget(
        verPadding: 5,
        horPadding: 40,
        child: myTextWidget(label: item.name),
      ),
      myCustomPaddingWidget(
        verPadding: 5,
        child: myTextWidget(label: "${item.ordered}"),
      ),
      myCustomPaddingWidget(
        verPadding: 5,
        horPadding: 40,
        child: myTextWidget(label: "${item.price}"),
      ),
      myCustomPaddingWidget(
        verPadding: 5,
        child: myTextWidget(label: "${item.qty * item.price}"),
      ),
    ],
  );
}
