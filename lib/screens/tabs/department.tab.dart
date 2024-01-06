import 'package:flutter/material.dart';
import 'package:quanlynhanvien/components/add.discipline.type.component.dart';

class DepartmentTab extends StatelessWidget {
  const DepartmentTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AddDisciplineTypeComponent();
                });
          },
          child: Text('show dialog'),
        )
      ],
    ));
  }
}
