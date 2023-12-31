import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/failed_snackbar.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/chucvu.model.dart';
import 'package:quanlynhanvien/providers/chucvu.provider.dart';
import 'package:quanlynhanvien/providers/nguoidung.provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _username;
  String? _password;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final nguoiDungProvider = Provider.of<NguoiDungProvider>(context);
    return Scaffold(
        backgroundColor: AppColors.greyIron,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 4 * MediaQuery.of(context).size.height / 5,
                width: 2 * MediaQuery.of(context).size.width / 9,
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/house_image.png'),
                        fit: BoxFit.fill)),
              ),
              Container(
                height: 4 * MediaQuery.of(context).size.height / 5,
                width: 2 * MediaQuery.of(context).size.width / 9,
                decoration: const BoxDecoration(
                  color: AppColors.whitePorcelain,
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                              fit: BoxFit.contain)),
                    ),
                    Container(
                      height: 300,
                      width: 2 * MediaQuery.of(context).size.width / 9,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        //color: AppColors.appButtonColor
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Đăng Nhập",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "CeraPro"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.greyIron),
                                child: TextField(
                                  onChanged: (value) {
                                    _username = value;
                                  },
                                  onTap: () {},
                                  decoration: const InputDecoration(
                                    hintText: 'Tên đăng nhập',
                                    hintStyle: TextStyle(
                                        color: AppColors.greyShuttle,
                                        fontFamily: 'CeraPro',
                                        fontWeight: FontWeight.w400),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 10),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.greyIron),
                                child: TextField(
                                  onChanged: (value) {
                                    _password = value;
                                  },
                                  onTap: () {},
                                  style: const TextStyle(
                                      fontFamily: "CeraPro",
                                      fontSize: 16,
                                      color: AppColors.black),
                                  decoration: const InputDecoration(
                                    hintText: 'Mật khẩu',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {},
                                splashColor: AppColors.blue,
                                child: const Text(
                                  'Quên mật khẩu?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "CeraPro"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: InkWell(
                                  onTap: () async {
                                    try {
                                      setState(() {
                                        loading = true;
                                      });
                                      await nguoiDungProvider.dangNhap(
                                          _username!, _password!);

                                      if (nguoiDungProvider.isLoggedIn) {
                                        if (nguoiDungProvider
                                                .nguoiDung!.loaiND ==
                                            'manager') {
                                          Navigator.pushNamed(context,
                                              '/managerStaff/Overview');
                                        } else if (nguoiDungProvider
                                                .nguoiDung!.loaiND ==
                                            'financial') {
                                          Navigator.pushNamed(
                                              context, '/financial/Overview');
                                        } else {
                                          Navigator.pushNamed(
                                              context, '/staff/Wage');
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(buildFailedSnackbar(
                                                'Đăng nhập không thành công!'));
                                      }
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(buildFailedSnackbar(
                                              'Đăng nhập không thành công!'));
                                    }
                                    setState(() {
                                      loading = false;
                                    });
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: AppColors.greyDark,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    alignment: Alignment.center,
                                    child: loading
                                        ? const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: SizedBox(
                                              height: 10,
                                              width: 10,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        : const Text(
                                            'ĐĂNG NHẬP',
                                            style: TextStyle(
                                                fontFamily: 'CeraPro',
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
