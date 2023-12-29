import 'package:flutter/material.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

class HeaderComponent extends StatefulWidget {
  final String name;
  final String avatar;
  final String email;

  const HeaderComponent(
      {super.key,
      required this.name,
      required this.email,
      required this.avatar});

  @override
  State<HeaderComponent> createState() => _HeaderComponentState();
}

class _HeaderComponentState extends State<HeaderComponent> {
  String? _name;
  String? _avatar;
  String? _emali;

  @override
  void initState() {
    _name = widget.name;
    _avatar = widget.avatar;
    _emali = widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.bluedarkColor,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.contain)),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "QUẢN LÝ NHÂN VIÊN",
                  style: TextStyle(
                      fontSize: 27, fontFamily: 'CeraPro', color: Colors.white),
                )
              ],
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _name!,
                      style: const TextStyle(
                          color: Colors.white, fontFamily: 'CeraPro'),
                    ),
                    Text(
                      _emali!,
                      style: const TextStyle(
                          color: Colors.white, fontFamily: 'CeraPro'),
                    )
                  ],
                ),
                Container(
                  height: 50,
                  width: 55,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(_avatar!), fit: BoxFit.contain)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
