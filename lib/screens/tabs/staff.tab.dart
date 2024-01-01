import 'package:flutter/material.dart';

class StaffTab extends StatelessWidget {
  const StaffTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.amber,
            child: const Center(
              child: Text("Staff"),
            )));
  }
}
