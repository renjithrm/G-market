import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/constant/const.dart';
import 'package:user_app/controller/get_builder_controller.dart';
import 'package:user_app/controller/user_login_controller.dart';
import 'package:user_app/service/shared_preference.dart';

class UserSignIn extends StatefulWidget {
  UserSignIn({Key? key}) : super(key: key);

  @override
  State<UserSignIn> createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  final _userName = TextEditingController();
  final _emailAddress = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _controller = Get.find<Controller>();
  final _loginController = Get.put(UserLoginController());
  late bool iskeybord;
  @override
  Widget build(BuildContext context) {
    iskeybord = MediaQuery.of(context).viewInsets.bottom != 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        iskeybord
            ? CustomPaint(
                size: Size(size.width, size.height * 0.6),
                painter: CURVECustomPainter(),
              )
            : Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  CustomPaint(
                    size: Size(size.width, size.height),
                    painter: RPSCustomPainter(),
                  ),
                  CustomPaint(
                    size: Size(size.width, size.height),
                    painter: BOTCustomPainter(),
                  ),
                ],
              ),
        SafeArea(
          child: Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(children: [
                  Text(
                    "Register",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    height: iskeybord ? size.height * 0.02 : size.height * 0.08,
                  ),
                  formField(
                    controller: _userName,
                    validator: MultiValidator([
                      requriedValidation,
                      MinLengthValidator(4, errorText: "user name is too short")
                    ]),
                    icon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    hindText: "Enter user name",
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(
                    height: iskeybord ? size.height * 0.01 : size.height * 0.03,
                  ),
                  formField(
                    controller: _emailAddress,
                    validator: MultiValidator([
                      requriedValidation,
                      EmailValidator(errorText: "Enter valid email address"),
                    ]),
                    icon: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    hindText: "Enter email address",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: iskeybord ? size.height * 0.01 : size.height * 0.03,
                  ),
                  formField(
                    controller: _phoneNumber,
                    validator: MultiValidator([
                      requriedValidation,
                      MinLengthValidator(10,
                          errorText: "Enter valid phone number"),
                      MaxLengthValidator(10,
                          errorText: "Enter valid phone number")
                    ]),
                    icon: const Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    hindText: "Enter phone number",
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: iskeybord ? size.height * 0.01 : size.height * 0.03,
                  ),
                  GetBuilder<Controller>(
                      id: "RegIcon",
                      builder: (_) {
                        return formField(
                            controller: _password,
                            validator: MultiValidator([
                              requriedValidation,
                              MinLengthValidator(5,
                                  errorText: "password too short"),
                            ]),
                            icon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            hindText: "Enter password",
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _controller.obscureText,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _controller.obscureText =
                                      !_controller.obscureText;
                                  _controller.update(["RegIcon"]);
                                },
                                icon: FaIcon(
                                  _controller.obscureText
                                      ? FontAwesomeIcons.eyeSlash
                                      : FontAwesomeIcons.eye,
                                  color: Colors.black,
                                  size: 20,
                                )));
                      }),
                  SizedBox(
                    height:
                        iskeybord ? size.height * 0.015 : size.height * 0.03,
                  ),
                  buttonn(onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var response = await _loginController.userRegister(
                          userName: _userName.text,
                          email: _emailAddress.text,
                          phoneNumber: int.parse(_password.text),
                          password: _password.text);
                      if (response == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          "Some thing wrong try later....",
                          style: GoogleFonts.roboto(color: Colors.red),
                        )));
                        return;
                      }
                      if (response != null) {
                        await SaveId.saveId(response["_id"]);
                        await Navigator.of(context)
                            .pushReplacementNamed("/home");
                      }
                    }
                  }),
                  TextButton(
                      onPressed: () {
                        _controller.togglePage();
                      },
                      child: Text(
                        "Alredy have an accound",
                        style: GoogleFonts.roboto(
                            color: iskeybord ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold),
                      ))
                ]),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Widget buttonn({required void Function()? onPressed}) {
    //  var states =  MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.pressed));
    return Container(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text("Register"),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) =>
                states.contains(MaterialState.pressed)
                    ? Colors.green
                    : Colors.black),
            shape: MaterialStateProperty.resolveWith((states) =>
                states.contains(MaterialState.pressed)
                    ? RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))
                    : RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
      ),
    );
  }

  Widget formField({
    TextEditingController? controller,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    String? hindText,
    Icon? icon,
    Widget? suffixIcon,
    bool? obscureText,
    String? label,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
            errorStyle: GoogleFonts.roboto(color: Colors.black),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(40)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(20)),
            filled: true,
            fillColor: iskeybord ? const Color(0xff6ebde6) : Colors.grey[400],
            hintText: hindText,
            prefixIcon: icon,
            suffixIcon: suffixIcon),
        obscureText: obscureText ?? false,
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height * -0.0017876);
    path0.lineTo(0, size.height * 0.2011339);
    path0.quadraticBezierTo(size.width * 0.3812060, size.height * 0.2138074,
        size.width * 0.3819699, 0);
    path0.quadraticBezierTo(size.width * 0.2934861, size.height * 0.0007604,
        size.width * 0.0030810, size.height * 0.0004936);
    path0.lineTo(0, size.height * -0.0017876);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BOTCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.4669157);
    path0.lineTo(0, size.height * 1.0005337);
    path0.lineTo(size.width, size.height * 1.0005337);
    path0.quadraticBezierTo(size.width, size.height * 0.6003202, size.width,
        size.height * 0.4669157);
    path0.quadraticBezierTo(size.width * 0.5106597, size.height * 0.2668090, 0,
        size.height * 0.4669157);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CURVECustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color(0xfff55486)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.3408387);
    path0.lineTo(size.width * 0.5102778, size.height * 0.6844040);
    path0.quadraticBezierTo(size.width * 0.9095370, size.height * 0.6979240,
        size.width * 0.8932407, size.height * 0.3412931);
    path0.quadraticBezierTo(size.width * 0.7654167, size.height * 0.2559698,
        size.width * 0.3819444, 0);
    path0.lineTo(0, 0);
    path0.lineTo(0, size.height * 0.3408387);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
