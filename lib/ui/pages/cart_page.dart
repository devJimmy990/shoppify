import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/bloc/cart/cart_logic.dart';
import 'package:online_store/bloc/cart/cart_state.dart';
import '../.widgets/cart_item_widget.dart';
import '../screen_helper/cartBottom.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartLogic(),
      child: BlocConsumer<CartLogic, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          CartLogic cart = BlocProvider.of(context);
          return Container(
            color: Colors.black12,
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    padding: const EdgeInsets.only(top: 15),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                    ),
                    child: ListView.builder(
                      itemCount: cart.getCartItems().length,
                      itemBuilder: (context, index) {
                        return myCartItem(
                            item: cart.getCartItems()[index],
                            onRemoveTap:()=> cart.deleteCartItem(index),
                            onIncrementTap: () {
                              cart.increaseItemQty(
                                  item: cart.getCartItems()[index]);
                              print("onIncrementTap Total is: ${cart.total}");
                            },
                            onDecrementTap: () {
                              cart.decreaseItemQty(
                                  item: cart.getCartItems()[index]);
                              print("onDecrementTap Total is: ${cart.total}");
                            });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 2.5),
                 Expanded(flex: 2, child: cartBottomNavBar(context)),
              ],
            ),
          );
        },
      ),
    );
  }
}
