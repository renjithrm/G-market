import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/constant/const.dart';
import 'package:user_app/controller/get_cart_products.dart';
import 'package:user_app/controller/get_user_deatails_controller.dart';
import 'package:user_app/controller/payment_controller.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _getUserDetails = Get.find<GetUserdetails>();

  final _paymentController = Get.put(PaymentController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    var totalPrice = _getUserDetails.getTotal();
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Payment",
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
            child: Container(), preferredSize: const Size.fromHeight(50)),
        elevation: 0,
      ),
      body: Container(
        height: _size.height,
        width: _size.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 50,
                  ),
                  text(title: "User name"),
                  const SizedBox(
                    height: 5,
                  ),
                  // Text(_getUserDetails.userModel?.username ?? "User name"),
                  // divider,
                  formField(
                      controller: _paymentController.userNameController,
                      validator: requriedValidation),

                  const SizedBox(
                    height: 5,
                  ),
                  text(title: "Email"),
                  const SizedBox(
                    height: 20,
                  ),
                  // Text(_getUserDetails.userModel?.email ?? "Email"),
                  // divider,
                  formField(
                    controller: _paymentController.emailController,
                    validator: requriedValidation,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  text(title: "Phone number"),
                  const SizedBox(
                    height: 5,
                  ),
                  // Text(_getUserDetails.userModel!.phoneno.toString()),
                  // divider,
                  formField(
                    controller: _paymentController.phoneNumberController,
                    validator: requriedValidation,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  text(title: "Address"),
                  const SizedBox(
                    height: 5,
                  ),
                  formField(
                    controller: _paymentController.addressController,
                    validator: requriedValidation,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  text(title: "Total Price"),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("$totalPrice Rs"),
                  divider,
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 50,
                      width: _size.width * 0.5,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            print("in");
                            await _paymentController.openCheckout();
                            print("out");
                          } else {
                            Fluttertoast.showToast(
                              msg: "Fil all box",
                              textColor: Colors.red,
                            );
                          }
                        },
                        child: const Text("Pay Now"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) =>
                                    states.contains(MaterialState.pressed)
                                        ? const Color.fromARGB(255, 33, 212, 93)
                                        : primaryColor)),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  Widget text({required String title}) {
    return Text(
      title,
      style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  var divider = const Divider(
    thickness: 1.5,
    color: Colors.black,
  );
}
