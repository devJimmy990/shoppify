import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/bloc/database/database_logic.dart';
import 'package:online_store/bloc/database/database_state.dart';
import '../.widgets/custom_container_widget.dart';
import '../screen_helper/search_bar_widget.dart';
import '../screen_helper/categories_list.dart';
import '../screen_helper/items_grid_view.dart';
import 'package:flutter/material.dart';
import '../.widgets/text_widget_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DatabaseLogic()..getInstance(),
      child: BlocConsumer<DatabaseLogic, DatabaseState>(
        listener: (context, state) {},
        builder: (context, state) {
          DatabaseLogic myDB = BlocProvider.of(context);
          return Container(
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
            ),
            child: Stack(
              children: [
                ListView(
                  children: [
                    Column(
                      children: [
                         Padding(
                            padding:const EdgeInsets.only(top: 15),
                            child: mySearchBar()),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: myCustomContainer(
                            align: Alignment.centerLeft,
                            child: myTextWidget(
                              label: "Categories",
                              size: 20,
                              weight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                        myCategoriesList(context),
                        const SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: myCustomContainer(
                            align: Alignment.centerLeft,
                            child: myTextWidget(
                              label: "Best Selling",
                              size: 22,
                              weight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                        myItemsGrid(context),
                      ],
                    ),
                  ],
                ),
                // myDB.isPreview
                //     ? Center(
                //         child: Padding(
                //         padding: const EdgeInsets.symmetric(
                //             horizontal: 8, vertical: 50),
                //         child: Container(
                //           width: 350,
                //           height: 300,
                //           decoration: BoxDecoration(
                //               color: Colors.indigo.withOpacity(.4),
                //               borderRadius: BorderRadius.circular(10)),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.stretch,
                //             children: [
                //               InkWell(
                //                 onTap: () => myDB.isItemPreview(false),
                //                 child: const Icon(Icons.close),
                //               ),
                //               Text(myDB.getItemPreview().name, style:const TextStyle(color: Colors.white),)
                //             ],
                //           ),
                //         ),
                //       ))
                //     : const SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }
}
