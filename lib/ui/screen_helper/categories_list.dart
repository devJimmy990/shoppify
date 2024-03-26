import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/bloc/database/database_logic.dart';
import '../.widgets/category_card_widget.dart';

Widget myCategoriesList(BuildContext context) {
  DatabaseLogic myDB = BlocProvider.of(context);
  return myDB.items.isEmpty
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              myDB.categories.length,
              (index) => myCategoryCard(
                category: myDB.categories[index],
              ),
            ),
          ));
}
