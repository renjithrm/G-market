import 'package:get/get.dart';
import 'package:user_app/constant/api_servics_links.dart';
import 'package:user_app/service/api_service.dart';
import 'package:user_app/service/shared_preference.dart';

class CartController extends GetxController {
  final _apiService = ApiServics();
  final _apiLinks = ApiLink();

  String userId = SaveId.getId();

  Future addItemToCart(String storeId, String productId) async {
    // print("${_apiLinks.ADD_ITEM_CART}$userId/$storeId/$productId");
    var response = await _apiService
        .getRespose("${_apiLinks.ADD_ITEM_CART}$userId/$storeId/$productId");

    if (response == null) return null;
    if (response != null) {
      print(response);
    } else {}
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
