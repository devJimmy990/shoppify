import '../.widgets/text_widget_widget.dart';
import 'custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:online_store/model/item.dart';


Widget myItemCard({
  required KItem item,
  required void Function() onViewTap,
  required void Function() onPreviewTap,
}) {
  return InkWell(
    onTap: onViewTap,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("${item.price} \$",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    )),


                item.discount > 0
                    ? myCustomContainer(
                        align: Alignment.center,
                        horPadding: 10,
                        verPadding: 5,
                        radius: 15,
                        bgColor: Colors.indigo,
                        child: myTextWidget(
                            label:
                                "${(item.discount * 100).toStringAsFixed(0)}%",
                            align: TextAlign.center,
                            size: 15,
                            color: Colors.white),
                      )
                    : const SizedBox(),
                           ],
            ),
          Expanded(child:   Container(
            margin: const EdgeInsets.all(10),
            child: item.isAsset
                ? Image.asset(
              item.image,
              width: 120,
              height: 120,
              fit: BoxFit.fill,
            )
                : Image.network(
              item.image,
              width: 120,
              height: 120,
              fit: BoxFit.fill,
            ),
          ),),
            myCustomContainer(
              align: Alignment.centerLeft,
              child: myTextWidget(
                  label: item.name,
                  maxLine: 1,
                  size: 15,
                  color: Colors.indigo,
                  weight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(item.desc,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.indigo,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // InkWell(
                  //   onTap: onPreviewTap,
                  //   child: const Icon(
                  //     Icons.visibility,
                  //     color: Colors.indigo,
                  //     size: 20,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
