import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:user_app/controller/get_builder_controller.dart';
import 'package:user_app/views/auth/user_login_screen.dart';
import 'package:user_app/views/auth/user_signin_screen.dart';

class Warper extends StatelessWidget {
  Warper({Key? key}) : super(key: key);
  final _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      id: "toggle",
      builder: (_) {
        return _controller.loginPage ? AuthScreen() : UserSignIn();
      },
    );
  }
}
