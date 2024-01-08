import 'package:flutter/material.dart';

SnackBar buildFailedSnackbar(String title) {
  return SnackBar(
    backgroundColor: Colors.red,
    content: Container(
      height: 50,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(
          Icons.close_outlined,
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
    width: 280.0, // Width of the SnackBar.

    padding: const EdgeInsets.symmetric(
      horizontal: 8.0, // Inner padding for SnackBar content.
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}
