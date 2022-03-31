import 'package:get/get.dart';
import 'package:user_app/constant/api_servics_links.dart';
import 'package:user_app/models/get_all_cart_model.dart';
import 'package:user_app/service/api_service.dart';
import 'package:user_app/service/shared_preference.dart';

class GetCartProductController extends GetxController {
  final _apiService = ApiServics();
  final _apiLinks = ApiLink();
  List<GetAllCartProducts> cartModel = [];
  @override
  void onInit() {
    getCartProduct();
    super.onInit();
  }

  @override
  void dispose() {
    getCartProduct();
    super.dispose();
  }

  Future getCartProduct() async {
    var userId = SaveId.getId();
    var response =
        await _apiService.getRespose(_apiLinks.GET_CART_PRODUCT + userId);

    if (response == null) return null;
    if (response != null) {
      cartModel = getAllCartProductsFromJson(response);
      print(cartModel);
    }
  }
}
