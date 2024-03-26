import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_store/model/item.dart';

Widget myCartItem({
  required KItem item,
  required void Function() onRemoveTap,
  required void Function() onIncrementTap,
  required void Function() onDecrementTap,
}) {
  return Container(
    height: 125,
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Radio(
              value: "",
              groupValue: "",
              activeColor: Colors.indigo,
              onChanged: (index) {}),
        ),
        Expanded(
          flex: 4,
          child: Container(
            height: 150,
            width: 125,
            margin: const EdgeInsets.only(right: 15),
            child: item.isAsset
                ? Image.asset(item.image,
                    width: 120, height: 100, fit: BoxFit.fill)
                : Image.network(item.image,
                    width: 120, height: 100, fit: BoxFit.fill),
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),
              ),
              Text("${item.price}\$",
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  )),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onRemoveTap,
                child: Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
              ),
              Container(
                height: 100,
                width: 25,
                decoration: BoxDecoration(
                    color: Colors.indigo.withOpacity(.8),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 5),
                    InkWell(
                      onTap: onIncrementTap,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          CupertinoIcons.plus,
                          size: 13,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "${item.ordered}",
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: onDecrementTap,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          CupertinoIcons.minus,
                          size: 13,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    ),
  );
}
