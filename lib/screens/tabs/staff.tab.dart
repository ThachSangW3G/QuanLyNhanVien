import 'package:flutter/material.dart';

class StaffTab extends StatelessWidget {
  const StaffTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.blueAccent,
            child: const Center(
              child: Text("AddStaff"),
            )));
  }
}
