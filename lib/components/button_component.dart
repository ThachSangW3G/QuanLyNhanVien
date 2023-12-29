import 'package:flutter/material.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

class ButtonComponent extends StatefulWidget {
  final IconData? iconDataStart;
  final IconData? iconDataEnd;
  final String title;
  final bool check;
  final VoidCallback onPressed;
  const ButtonComponent(
      {super.key,
      this.iconDataStart,
      this.iconDataEnd,
      required this.onPressed,
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
          : const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.check
              ? const Color.fromARGB(255, 86, 65, 43)
              : AppColors.bluedarkColor,
          padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              top: 20,
              bottom: 20), // Khoảng cách giữa các phần tử trong nút
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              widget.iconDataStart,
              color: Colors.white,
            ), // Biểu tượng
            const SizedBox(
                width: 6.0), // Khoảng cách giữa biểu tượng và tiêu đề
            Text(
              widget.title,
              style: const TextStyle(color: Colors.white),
            ), // Tiêu đề
            const SizedBox(
                width: 6.0), // Khoảng cách giữa tiêu đề và biểu tượng
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
