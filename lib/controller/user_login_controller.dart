import 'dart:convert';

import 'package:get/get.dart';
import 'package:user_app/constant/api_servics_links.dart';
import 'package:user_app/service/api_service.dart';

class UserLoginController extends GetxController {
  final _apiService = ApiServics();
  final _apiLinks = ApiLink();

  Future userLogin({required String emailid, required String password}) async {
    var userData = {"email": emailid, "password": password};
    var jsonResponse =
        await _apiService.postData(_apiLinks.USER_LOGIN_URL, userData);
    if (jsonResponse == null) return null;
    var responseData = jsonDecode(jsonResponse);
    // print(responseData);
    return responseData;
  }

  Future userRegister({
    required String userName,
    required String email,
    required int phoneNumber,
    required String password,
  }) async {
    var userData = {
      "username": userName,
      "email": email,
      "phoneno": phoneNumber,
      "password": password
    };
    var response =
        await _apiService.postData(_apiLinks.USER_REGISTER, userData);
    if (response == null) return null;
    var jsonData = jsonDecode(response);
    // print(jsonData);
    return jsonData;
  }
}
