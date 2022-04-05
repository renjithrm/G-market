import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:user_app/constant/api_servics_links.dart';
import 'package:user_app/constant/globel_keys.dart';
import 'package:user_app/controller/get_user_deatails_controller.dart';
import 'package:user_app/service/api_service.dart';
import 'package:user_app/service/shared_preference.dart';

class PaymentController extends GetxController {
  late Razorpay _razorpay;

  final _getUserDetails = Get.find<GetUserdetails>();
  final _apiLink = ApiLink();
  final _apiServise = ApiServics();

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  var userId = SaveId.getId();

  @override
  void onInit() {
    _razorpay = Razorpay();

    userNameController.text = _getUserDetails.userModel?.username ?? "";
    emailController.text = _getUserDetails.userModel?.email ?? "";
    phoneNumberController.text =
        _getUserDetails.userModel?.phoneno.toString() ?? "";

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    super.onInit();
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print(" payment Id:::::::::${response.paymentId}");
    navigatorKey.currentState!.pop();
    var userData = {
      "userid": userId,
      "paymentid": response.paymentId,
      "totalamount": _getUserDetails.getTotal(),
      "address": addressController.text
    };

    var apiResponse =
        await _apiServise.postData(_apiLink.CREATE_NEW_ORDER, userData);
    log("apiResponse:::::$apiResponse");

    if (apiResponse == null) {
      await Fluttertoast.showToast(
        msg: "some error",
        textColor: Colors.red,
      );
    } else {
      var jsonResponse = jsonDecode(apiResponse);
      await Fluttertoast.showToast(
        msg: jsonResponse["message"],
        textColor: Colors.greenAccent,
      );
    }
  }

  _handlePaymentError(PaymentFailureResponse response) async {
    // log("error $response");
    await Fluttertoast.showToast(
      msg: "Payment Error",
      textColor: Colors.red,
    );
  }

  _handleExternalWallet(ExternalWalletResponse response) async {
    // log("external wallet $response");
    await Fluttertoast.showToast(
      msg: "Payment using external wallet",
      textColor: Colors.greenAccent,
    );
  }

  Future openCheckout() async {
    var amount = _getUserDetails.getTotal();
    var options = {
      'key': 'rzp_test_oG6MXV78oxIITM',
      'amount': num.parse(amount.toString()) * 100,
      'name': userNameController.text,
      'description': 'Payment',
      'prefill': {
        'contact': phoneNumberController.text,
        'email': emailController.text,
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
