import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

class InputNumberField extends StatefulWidget {
  final String label;
  final String hinttext;
  final String name;
  final ValueChanged<String> onChanged;

  const InputNumberField(
      {super.key,
      required this.label,
      required this.name,
      required this.hinttext,
      required this.onChanged});

  @override
  State<InputNumberField> createState() => _InputNumberComponentState();
}

class _InputNumberComponentState extends State<InputNumberField> {
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
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ],
      ),
    );
  }
}
