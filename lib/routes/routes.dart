import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:quanlynhanvien/screens/login_screen.dart';
import 'package:quanlynhanvien/screens/manager_staff_screen.dart';
import 'package:quanlynhanvien/screens/staff_screen.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static final Handler _loginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const ManagerStaffScreen(
            page: 'Position',
          ));

  static final Handler _managerStaffHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          ManagerStaffScreen(
            page: params['name'][0],
          ));
  static final Handler _staffHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          ManagerStaffScreen(
            page: params['name'][0],
          ));

  static void setUpRouter() {
    router.define("/", handler: _loginHandler);
    router.define("/managerStaff/:name",
        handler: _managerStaffHandler, transitionType: TransitionType.none);
    router.define("/staff/:name",
        handler: _staffHandler, transitionType: TransitionType.none);
  }
}
