import 'dart:developer';

import 'package:get/get.dart';
import 'package:user_app/constant/api_servics_links.dart';
import 'package:user_app/models/user_order_model.dart';
import 'package:user_app/service/api_service.dart';
import 'package:user_app/service/shared_preference.dart';

class OrderController extends GetxController {
  final _apiService = ApiServics();
  final _apiLink = ApiLink();

  final userId = SaveId.getId();
  List<UserProductOrder>? orderModel;
  //List<Product>? productList;

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }

  Future getOrders() async {
    var response =
        await _apiService.getRespose(_apiLink.GET_ORDER_USER + userId);

    if (response == null) {
      print(response);
      return null;
    } else {
      orderModel = userProductOrderFromJson(response);
      var productList = orderModel!.map((element) => element.products);

      log(productList.toString());
    }
  }
}
