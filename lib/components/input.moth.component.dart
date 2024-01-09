import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:intl/intl.dart';

class InputMonthPicker extends StatefulWidget {
  final String label;
  final String hinttext;
  final String? name;
  final ValueChanged<DateTime> onChanged;

  const InputMonthPicker(
      {super.key,
      required this.label,
      required this.name,
      required this.hinttext,
      required this.onChanged});

  @override
  State<InputMonthPicker> createState() => _InputNumberComponentState();
}

class _InputNumberComponentState extends State<InputMonthPicker> {
  DateTime? selectedDate;

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      initialDatePickerMode: DatePickerMode.year,
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.onChanged(selectedDate!);
    }
  }

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
            //initialValue: widget.name ?? 'DD/MM/YYYY',
            validator: (value) =>
                (value?.isEmpty ?? true) ? 'Title is required' : null,
            readOnly: true,
            controller: TextEditingController(
              text: selectedDate != null
                  ? DateFormat('MM/yyyy').format(selectedDate!)
                  : widget.name,
            ),
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
                suffixIcon: GestureDetector(
                  onTap: () => _selectDate(context),
                  child: const Icon(Icons.date_range_outlined),
                ),
                fillColor: AppColors.whitePorcelain),
          ),
        ],
      ),
    );
  }
}
