import 'package:flutter/material.dart';
import 'package:online_store/bloc/screen/screen_logic.dart';
import 'package:online_store/bloc/screen/screen_state.dart';
import 'package:online_store/ui/.widgets/appbar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BaseHomeScreen extends StatelessWidget {
  const BaseHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScreenLogic(),
      child: BlocConsumer<ScreenLogic, ScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          ScreenLogic screen = BlocProvider.of(context);
          return Scaffold(
            appBar: const MyCustomAppBar(),
            body: screen.getCurrentScreen(),
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              color: Colors.indigo,
              height: 50,
              onTap: (index) async => screen.changeScreen(index),
              items: const [
                Icon(
                  Icons.home,
                  size: 25,
                  color: Colors.white,
                ),
                Icon(
                  Icons.shopping_cart,
                  size: 25,
                  color: Colors.white,
                ),
                Icon(
                  Icons.list,
                  size: 25,
                  color: Colors.white,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
