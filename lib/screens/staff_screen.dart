import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/providers/nguoidung.provider.dart';
import 'package:quanlynhanvien/screens/login_screen.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({super.key});

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  @override
  Widget build(BuildContext context) {
    final nguoiDungProvider = Provider.of<NguoiDungProvider>(context);
    return Consumer<NguoiDungProvider>(
      builder: (context, provider, _) {
        final check = provider.isLoggedIn;
        return check == true
            ? Container(
                child: const Text("shhhhhhhhhh"),
              )
            : const LoginScreen();
      },
    );
  }
}
