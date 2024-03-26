import 'package:flutter/material.dart';

SnackBar mySnakbar({required String label, required BuildContext context}) {
  return SnackBar(
    width: 250,
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.grey,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    content: Center(
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black, fontSize: 16),
      ),
    ),
  );
}
