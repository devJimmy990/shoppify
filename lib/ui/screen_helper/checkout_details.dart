import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/bloc/cart/cart_state.dart';

import '../../bloc/cart/cart_logic.dart';
import '../.widgets/text_widget_widget.dart';
import '../.widgets/checkout_row_widget.dart';
import '../.widgets/custom_padding_widget.dart';
import 'chekout_data_table.dart';

class MyCheckoutDetails extends StatelessWidget {
  const MyCheckoutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartLogic()..getCartItems(),
      child: BlocConsumer<CartLogic, CartState>(
        listener: (context, stata) {},
        builder: (context, stata) {
          CartLogic cart = BlocProvider.of(context);
          return Card(
            color: Colors.grey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          cart.clearCartItems();
                          Navigator.of(context).pop();
                        },
                        child: myCustomPaddingWidget(
                          horPadding: 10,
                          verPadding: 8,
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.close),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      cart.getCartItems().isEmpty
                          ? Center(
                              child: myTextWidget(
                                  label: "No Items in Cart...",
                                  size: 18,
                                  weight: FontWeight.w500),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: myCheckoutDataTable(
                                        cart.getCartItems()),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      myTextWidget(
                          label: "Total: ${cart.total}\$",
                          size: 18,
                          weight: FontWeight.bold),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),                        child: myTextWidget(
                            label: "Discount: ${cart.total - cart.totalDiscount}\$",
                            size: 18,
                            weight: FontWeight.bold),
                      ),
                      myTextWidget(
                          label: "After Discount: ${cart.totalDiscount}\$",
                          size: 18,
                          weight: FontWeight.bold),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
