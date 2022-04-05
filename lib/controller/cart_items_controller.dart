import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/constant/api_servics_links.dart';
import 'package:user_app/constant/globel_keys.dart';
import 'package:user_app/controller/get_cart_products.dart';
import 'package:user_app/service/api_service.dart';
import 'package:user_app/service/shared_preference.dart';

class CartController extends GetxController {
  final _apiService = ApiServics();
  final _apiLinks = ApiLink();

  String userId = SaveId.getId();

  Future addItemToCart(
    String storeId,
    String productId,
  ) async {
    // print("${_apiLinks.ADD_ITEM_CART}$userId/$storeId/$productId");
    var response = await _apiService
        .getRespose("${_apiLinks.ADD_ITEM_CART}$userId/$storeId/$productId");

    if (response == null) {
      Get.dialog(Dialog(
        child: Container(
          height: 150,
          width: 200,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Text("Other store exists clear cart",
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        navigatorKey.currentState!.pop();
                      },
                      child: const Text("Cancel")),
                  TextButton(
                      onPressed: () async {
                        print(userId);
                        var response = await _apiService.delectItems(
                            url: _apiLinks.GET_CART_PRODUCT + "/" + userId);
                        print(response);
                        var nextResponse = await _apiService.getRespose(
                            "${_apiLinks.ADD_ITEM_CART}$userId/$storeId/$productId");
                        Get.find<GetCartProductController>()
                            .update(["cartScreen", "cartButton", "cartScreen"]);
                        // Get.find<GetCartProductController>().cartModel.clear();
                        navigatorKey.currentState!.pop();
                      },
                      child: const Text("Remove"))
                ],
              )
            ],
          ),
        ),
      ));
      return response;
    }

    if (response != null) {
      print(response);
      return response;
    }
  }

  Future delectFromCart({required String productId}) async {
    var response = await _apiService.delectItems(
        url: "${_apiLinks.DELECT_CART_NAME}/$userId/$productId");

    if (response == null) return null;
    if (response != null) {
      print(response);
    }
  }

  Future incrementCartItem({required String productId}) async {
    var response = await _apiService.updateItems(
        url: "${_apiLinks.INCREMENT_CART_ITEM}/$userId/$productId");
    if (response == null) return null;
    if (response != null) {
      //  print("res:::$response");
    }
  }

  Future decrementCartItem({required String productId}) async {
    var response = await _apiService.updateItems(
        url: "${_apiLinks.DECREMENT_CART_ITEM}/$userId/$productId");

    if (response == null) return null;
    if (response != null) {
      print(response);
    }
  }
}
