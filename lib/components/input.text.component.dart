import 'package:flutter/material.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

class InputTextField extends StatefulWidget {
  final String label;
  final String hinttext;
  String name;
  final bool isRequired;
  final ValueChanged<String> onChanged;
  bool? readOnly;
  bool? obscureText;

  InputTextField(
      {super.key,
      required this.label,
      required this.name,
      required this.hinttext,
      required this.isRequired,
      required this.onChanged,
      this.readOnly,
      this.obscureText});

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
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
              if (widget.isRequired)
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
              obscureText:
                  widget.obscureText != null && widget.obscureText == true
                      ? true
                      : false,
              readOnly: widget.readOnly != null && widget.readOnly == true
                  ? true
                  : false,
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
                  fillColor: AppColors.whitePorcelain)),
        ],
      ),
    );
  }
}
