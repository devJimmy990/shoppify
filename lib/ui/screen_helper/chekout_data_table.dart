import 'package:flutter/material.dart';

import '../../model/item.dart';

Widget myCheckoutDataTable(List<KItem> cart) {
  return DataTable(columns: const [
    DataColumn(label: Text("ID")),
    DataColumn(label: Text("Name")),
    DataColumn(label: Text("Price")),
    DataColumn(label: Text("Qty")),
    DataColumn(label: Text("Total")),
  ], rows: myRows(cart));
}

List<DataRow> myRows(List<KItem> cart) => cart.map((item) {
      final cells = [
        item.id,
        item.name,
        item.price,
        item.ordered,
        item.price * item.ordered
      ];
      return DataRow(cells: getCells(cells));
    }).toList();

List<DataCell> getCells(List<Object> cells) =>
    cells.map((data) => DataCell(Text("$data"))).toList();
