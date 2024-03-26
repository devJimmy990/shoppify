import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:online_store/bloc/screen/screen_state.dart';
import 'package:online_store/ui/pages/home_page.dart';
import 'package:online_store/ui/pages/cart_page.dart';

class ScreenLogic extends Cubit<ScreenState> {
  ScreenLogic() : super(InitScreen());
  int index = 0;

  List<Widget> screens = [
    const HomePage(),
    const CartPage(),
    const Center(
        child: Text(
      "Coming Soon",
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    )),
  ];

  changeScreen(int newIndex) {
    index = newIndex;
    emit(ChangeScreen());
  }

  getCurrentScreen() => screens[index];
}
