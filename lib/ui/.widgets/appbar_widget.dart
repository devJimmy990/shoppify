import 'package:flutter/material.dart';

import 'text_widget_widget.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyCustomAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Icon(
        Icons.sort,
        size: 35,
        color: Colors.indigo,
      ),
      title: myTextWidget(
          label: "MJ Shop",
          size: 20,
          weight: FontWeight.w800,
          color: Colors.indigo),

    );
  }
}
