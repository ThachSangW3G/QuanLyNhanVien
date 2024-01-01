import 'package:flutter/material.dart';

class DepartmentTab extends StatelessWidget {
  const DepartmentTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.blue,
            child: const Center(
              child: Text("Department"),
            )));
  }
}
