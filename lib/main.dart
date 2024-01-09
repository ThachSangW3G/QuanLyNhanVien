import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/providers/chucvu.provider.dart';
import 'package:quanlynhanvien/providers/khenthuong.provider.dart';
import 'package:quanlynhanvien/providers/kyluat.provider.dart';
import 'package:quanlynhanvien/providers/loaikhenthuong.provider.dart';
import 'package:quanlynhanvien/providers/loaikyluat.provider.dart';
import 'package:quanlynhanvien/providers/nguoidung.provider.dart';
import 'package:quanlynhanvien/providers/nhanvien.provider.dart';
import 'package:quanlynhanvien/providers/phongban.provider.dart';
import 'package:quanlynhanvien/routes/routes.dart';
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
      ChangeNotifierProvider(create: (_) => ChucVuProvider()),
      ChangeNotifierProvider(create: (_) => PhongBanProvider()),
      ChangeNotifierProvider(create: (_) => NhanVienProvider()),
      ChangeNotifierProvider(create: (_) => LoaiKhenThuongProvider()),
      ChangeNotifierProvider(create: (_) => KhenThuongProvider()),
      ChangeNotifierProvider(create: (_) => LoaiKyLuatProvider()),
      ChangeNotifierProvider(create: (_) => KyLuatProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    Flurorouter.setUpRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'Flutter Demo',
      onGenerateRoute: Flurorouter.router.generator,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: Consumer<NguoiDungProvider>(
      //   builder: (context, nguoiDungProvider, _) {
      //     final check = nguoiDungProvider.isLoggedIn;
      //     return check
      //         ? nguoiDungProvider.nguoiDung!.loaiND == 'manager'
      //             ? const ManagerStaffScreen()
      //             : nguoiDungProvider.nguoiDung!.loaiND == 'financial'
      //                 ? const FinancialScreen()
      //                 : const StaffScreen()
      //         : const LoginScreen();
      //   },
      // )
    );
  }
}
