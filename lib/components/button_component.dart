import 'package:flutter/material.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

class ButtonComponent extends StatefulWidget {
  final IconData? iconDataStart;
  final IconData? iconDataEnd;
  final String title;
  final bool check;
  const ButtonComponent(
      {super.key,
      this.iconDataStart,
      this.iconDataEnd,
      required this.title,
      required this.check});

  @override
  State<ButtonComponent> createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.iconDataStart == null
          ? const EdgeInsets.all(2)
          : const EdgeInsets.all(6),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: widget.check
              ? const Color.fromARGB(255, 94, 116, 149)
              : AppColors.bluedarkColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              widget.iconDataStart,
              color: Colors.white,
            ), // Biểu tượng
            const SizedBox(
                width: 8.0), // Khoảng cách giữa biểu tượng và tiêu đề
            Text(
              widget.title,
              style: const TextStyle(color: Colors.white),
            ), // Tiêu đề
            const SizedBox(
                width: 8.0), // Khoảng cách giữa tiêu đề và biểu tượng
            Icon(
              widget.iconDataEnd,
              color: Colors.white,
              size: 25,
            ), // Biểu tượng
          ],
        ),
      ),
    );
  }
}
