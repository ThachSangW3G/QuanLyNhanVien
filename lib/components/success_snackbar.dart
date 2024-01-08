import 'package:flutter/material.dart';

SnackBar buildSuccessSnackbar(String title) {
  return SnackBar(
    backgroundColor: Colors.green,
    content: Container(
      height: 50,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(
          Icons.check,
          color: Colors.white,
        ),
        const SizedBox(
          width: 18,
        ),
        Text(
          title,
        )
      ]),
    ),
    duration: const Duration(milliseconds: 1500),
    width: 320.0, // Width of the SnackBar.

    padding: const EdgeInsets.symmetric(
      horizontal: 8.0, // Inner padding for SnackBar content.
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}
