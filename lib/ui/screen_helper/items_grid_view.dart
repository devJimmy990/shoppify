import 'package:flutter/material.dart';
import '../.widgets/item_card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/bloc/database/database_logic.dart';
import 'package:online_store/ui/screens/item_details_screen.dart';

Widget myItemsGrid(BuildContext context) {
  DatabaseLogic myDB = BlocProvider.of(context);
  return myDB.items.isEmpty
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 0.68,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            myDB.items.length,
            (index) => myItemCard(
              item: myDB.items[index],
              onPreviewTap: () => myDB.isItemPreview(true,item:  myDB.items[index]),
              onViewTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      ItemDetailsScreen(item: myDB.items[index]),
                ),
              ),
            ),
          ),
        );
}
