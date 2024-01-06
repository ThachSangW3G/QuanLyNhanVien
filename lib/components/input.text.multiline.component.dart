import 'package:flutter/material.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

class InputTextMultiline extends StatefulWidget {
  final String label;
  final String hinttext;
  final String name;
  final ValueChanged<String> onChanged;

  const InputTextMultiline(
      {super.key,
      required this.label,
      required this.name,
      required this.hinttext,
      required this.onChanged});

  @override
  State<InputTextMultiline> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextMultiline> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.label),
              const Text(
                '*',
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            initialValue: widget.name,
            validator: (value) =>
                (value?.isEmpty ?? true) ? 'Title is required' : null,
            onChanged: (value) {
              widget.onChanged(value);
            },
            decoration: InputDecoration(
                hintText: widget.hinttext,
                enabledBorder: const OutlineInputBorder(
                  // viền khi không có focus
                  borderSide: BorderSide(color: AppColors.greyIron),
                ),
                focusedBorder: const OutlineInputBorder(
                  // viền khi có focus
                  borderSide: BorderSide(color: AppColors.greyShuttle),
                ),
                labelStyle: const TextStyle(
                    fontFamily: 'CeraPro',
                    // fontSize: 14,
                    fontWeight: FontWeight.w400),
                filled: true,
                fillColor: AppColors.whitePorcelain),
            maxLines: 4, // Cho phép hiển thị nhiều dòng văn bản
            keyboardType:
                TextInputType.multiline, // Bàn phím hiển thị dạng đa dòng
            textInputAction: TextInputAction.newline,
          ),
        ],
      ),
    );
  }
}
