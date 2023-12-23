import 'package:flutter/material.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _username;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.greyIron,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                width: 250,
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/house_image.png'),
                        fit: BoxFit.fill)),
              ),
              Container(
                height: 400,
                width: 300,
                decoration: const BoxDecoration(
                  color: AppColors.whitePorcelain,
                  shape: BoxShape.rectangle,
                ),
                child: Column(
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
                      width: 200,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
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
                                onTap: () {},
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: AppColors.greyDark,
                                      borderRadius: BorderRadius.circular(15)),
                                  alignment: Alignment.center,
                                  child: const Text(
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
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
