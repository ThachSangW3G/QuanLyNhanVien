import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/providers/chucvu.provider.dart';
import 'package:quanlynhanvien/providers/nguoidung.provider.dart';
import 'package:quanlynhanvien/screens/financial_staff_screen.dart';
import 'package:quanlynhanvien/screens/login_screen.dart';

import 'package:quanlynhanvien/firebase_options.dart';
import 'package:quanlynhanvien/screens/manager_staff_screen.dart';
import 'package:quanlynhanvien/screens/staff_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NguoiDungProvider()),
      ChangeNotifierProvider(create: (_) => ChucVuProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Consumer<NguoiDungProvider>(
          builder: (context, nguoiDungProvider, _) {
            final check = nguoiDungProvider.isLoggedIn;
            return check
                ? nguoiDungProvider.nguoiDung!.loaiND == 'manager'
                    ? const ManagerStaffScreen()
                    : nguoiDungProvider.nguoiDung!.loaiND == 'financial'
                        ? const FinancialScreen()
                        : const StaffScreen()
                : const LoginScreen();
          },
        ));
  }
}
