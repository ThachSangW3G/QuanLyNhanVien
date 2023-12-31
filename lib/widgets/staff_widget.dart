import 'package:flutter/material.dart';
import 'package:quanlynhanvien/components/tablestaff.component.dart';

class StaffWidget extends StatefulWidget {
  const StaffWidget({super.key});

  @override
  State<StaffWidget> createState() => _StaffWidgetState();
}

class _StaffWidgetState extends State<StaffWidget> {
  @override
  Widget build(BuildContext context) {
    return const TableStaff();
  }
}
