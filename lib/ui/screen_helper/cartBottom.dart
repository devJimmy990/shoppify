import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/bloc/cart/cart_logic.dart';
import 'checkout_details.dart';

Widget cartBottomNavBar(BuildContext context) {
  CartLogic cart = BlocProvider.of(context);
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Container(
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white),
      padding: const EdgeInsets.only(top: 2.5, left: 20, right: 20, bottom: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                backgroundColor: const Color.fromRGBO(253, 253, 253, 1),
                elevation: 0,
              ),
              icon: const CircleAvatar(
                radius: 10,
                backgroundColor: Colors.indigo,
                child: Icon(Icons.add, size: 20, color: Colors.white),
              ),
              label: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Add coupon code",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),
              ),
              Text("${cart.total}\$",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  )),
            ],
          ),
          MaterialButton(
            onPressed: () {
              showBottomSheet(
                  context: context,
                  builder: (context) => const MyCheckoutDetails());
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.indigo,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Text("Check Out",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
    ),
  );
}
