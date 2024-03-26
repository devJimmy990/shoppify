import 'package:flutter/material.dart';
import '../.widgets/custom_container_widget.dart';

Widget mySearchBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: myCustomContainer(
      bgColor: Colors.white,
      height: 50,
      horMargin: 12,
      horPadding: 15,
      radius: 22,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5),
            width: 250,
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search Here....",
              ),
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.indigo)),
        ],
      ),
    ),
  );
}
