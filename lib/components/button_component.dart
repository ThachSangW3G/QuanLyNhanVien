import 'package:flutter/material.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

class ButtonComponent extends StatefulWidget {
  final IconData iconDataStart;
  final IconData iconDataEnd;
  final String title;
  final VoidCallback? onPressed;
  const ButtonComponent(
      {super.key,
      required this.iconDataStart,
      required this.iconDataEnd,
      required this.title,
      required this.onPressed});

  @override
  State<ButtonComponent> createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  IconData? _iconDataStart;
  IconData? _iconDataEnd;
  String? _title;
  VoidCallback? _onPressed;
  @override
  void initState() {
    _iconDataStart = widget.iconDataStart;
    _iconDataEnd = widget.iconDataEnd;
    _title = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          _onPressed;
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.bluedarkColor,
          padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 20,
              bottom: 20), // Khoảng cách giữa các phần tử trong nút
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(_iconDataStart), // Biểu tượng
            const SizedBox(
                width: 8.0), // Khoảng cách giữa biểu tượng và tiêu đề
            Text(_title!), // Tiêu đề
            const SizedBox(
                width: 8.0), // Khoảng cách giữa tiêu đề và biểu tượng
            Icon(_iconDataEnd), // Biểu tượng
          ],
        ),
      ),
    );
  }
}
