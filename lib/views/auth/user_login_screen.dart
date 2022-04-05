import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/constant/const.dart';
import 'package:user_app/controller/get_builder_controller.dart';
import 'package:user_app/controller/user_login_controller.dart';
import 'package:user_app/service/shared_preference.dart';

import 'package:user_app/views/widgets/costum_button.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _controller = Get.find<Controller>();

  final _loginController = Get.put(UserLoginController());

  Widget colDiv(double height) => SizedBox(
        height: height,
      );
  @override
  Widget build(BuildContext context) {
    var keybord = MediaQuery.of(context).viewInsets.bottom != 0;
    var _size = MediaQuery.of(context).size;
    // print(_size.width);
    // print(_size.height);
    return Scaffold(
        body: Container(
      width: _size.width,
      height: _size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffdbb767),
            Color(0xff31187f),
          ],
          begin: Alignment.topLeft,
        ),
      ),
      child: Column(children: [
        Expanded(
          flex: keybord ? 1 : 2,
          child: SizedBox(
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/login_screen_image.png",
                  ),
                ),
                Expanded(
                    child: Container(
                  child: Text(
                    "Shop Online",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ))
              ],
            ),
          ),
        ),
        Expanded(
          flex: keybord ? 3 : 2,
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            height: 300,
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Get started",
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    colDiv(7),
                    formField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: MultiValidator([
                          requriedValidation,
                          EmailValidator(errorText: "Enter valid email")
                        ]),
                        hindText: "abc@gmail.com",
                        icon: const Icon(
                          Icons.email,
                          color: Colors.black,
                        )),
                    colDiv(7),
                    GetBuilder<Controller>(
                        id: "passIcon",
                        builder: (_) {
                          return formField(
                            controller: passwordController,
                            keyboardType: TextInputType.emailAddress,
                            validator: MultiValidator([
                              requriedValidation,
                              MinLengthValidator(5,
                                  errorText: "password is too short")
                            ]),
                            hindText: "password",
                            icon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _controller.obscureText =
                                      !_controller.obscureText;
                                  _controller.update(["passIcon"]);
                                },
                                icon: FaIcon(
                                  _controller.obscureText
                                      ? FontAwesomeIcons.eyeSlash
                                      : FontAwesomeIcons.eye,
                                  color: Colors.black,
                                  size: 20,
                                )),
                            obscureText: _controller.obscureText,
                          );
                        }),
                    colDiv(15),
                    Container(
                      alignment: Alignment.center,
                      child: CostumButton(
                        height: 40,
                        width: 200,
                        text: "Continue",
                        color: Colors.blue,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            var response = await _loginController.userLogin(
                              emailid: emailController.text,
                              password: passwordController.text,
                            );
                            if (response == null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                "Check your email address",
                                style: GoogleFonts.roboto(color: Colors.red),
                              )));
                              return;
                            }
                            if (response["email"] == emailController.text &&
                                response["password"] ==
                                    passwordController.text) {
                              await SaveId.saveId(response["_id"]);
                              await Navigator.of(context)
                                  .pushReplacementNamed("/home");
                              print("in");
                            }
                          }
                        },
                      ),
                    ),
                    colDiv(7),
                    Container(
                      alignment: Alignment.center,
                      child: TextButton(
                          onPressed: () {
                            _controller.togglePage();
                          },
                          child: const Text("Register")),
                    )
                  ]),
            ),
          ),
        )
      ]),
    ));
  }
}
