import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/bloc/cart/cart_logic.dart';
import 'package:online_store/bloc/cart/cart_state.dart';
import 'package:online_store/model/item.dart';
import 'package:online_store/ui/.widgets/snakbar_widget.dart';

class ItemDetailsScreen extends StatelessWidget {
  final KItem item;
  final List<Color> cr = [
    Colors.black,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.pink
  ];
  ItemDetailsScreen({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartLogic(),
      child: BlocConsumer<CartLogic, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          CartLogic cart = BlocProvider.of(context);
          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                "Product Details",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.indigo),
              ),
              leading: const Icon(
                Icons.favorite,
                size: 20,
                color: Colors.red,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Colors.indigo,
                      )),
                )
              ],
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: item.isAsset
                      ? Image.asset(
                          item.image,
                          width: 200,
                          height: 200,
                        )
                      : Image.network(
                          item.image,
                          width: 200,
                          height: 200,
                        ),
                ),
                Arc(
                  edge: Edge.TOP,
                  arcType: ArcType.CONVEY,
                  height: 30,
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${item.qty}",
                                      style:const TextStyle(
                                          color: Colors.indigo,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () =>
                                              cart.decreaseQtyCounter(),
                                          child: const CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.indigo,
                                            child: Icon(
                                              CupertinoIcons.minus,
                                              size: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            "${item.qty==0? "0":   cart.qtyCounter}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () => cart.increaseQtyCounter(
                                              max: item.qty),
                                          child: const CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.indigo,
                                            child: Icon(
                                              CupertinoIcons.plus,
                                              size: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                item.desc,

                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.indigo,),
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                const Text(
                                  "Size :",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.indigo),
                                ),
                                const SizedBox(width: 5),
                                Row(
                                  children: [
                                    for (int i = 5; i < 10; i++)
                                      Container(
                                        height: 30,
                                        width: 30,
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 8,
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          "$i".toString(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.indigo),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                const Text(
                                  "Color :",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.indigo),
                                ),
                                const SizedBox(width: 5),
                                Row(
                                  children: [
                                    for (int i = 0; i < 5; i++)
                                      Container(
                                        height: 30,
                                        width: 30,
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        decoration: BoxDecoration(
                                          color: cr[i],
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              child: Container(
                height: 100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Price",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("${item.price}\$",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            )),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        cart.addCartItem(KItem(
                            id: item.id,
                            name: item.name,
                            desc: item.desc,
                            image: item.image,
                            price: item.price,
                            discount: item.discount,
                            isAsset: item.isAsset,
                            category: item.category,
                            qty: item.qty,
                            ordered: cart.qtyCounter,
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(
                            mySnakbar(label: "Added", context: context));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: MediaQuery.of(context).size.width * .5,
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text("Add to Cart",
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
            ),
          );
        },
      ),
    );
  }
}
