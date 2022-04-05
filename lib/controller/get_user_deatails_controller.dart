import 'package:get/get.dart';
import 'package:user_app/constant/api_servics_links.dart';
import 'package:user_app/controller/get_cart_products.dart';
import 'package:user_app/models/user_details_model.dart';
import 'package:user_app/service/api_service.dart';
import 'package:user_app/service/shared_preference.dart';

class GetUserdetails extends GetxController {
  final _apiLink = ApiLink();
  final _apiServics = ApiServics();
  final _getCartProduct = Get.find<GetCartProductController>();
  final userId = SaveId.getId();
  UserDetails? userModel;

  @override
  void onInit() {
    getUserDeatils();
    super.onInit();
  }

  Future getUserDeatils() async {
    var response =
        await _apiServics.getRespose(_apiLink.GET_USER_DETAILS + userId);
    if (response == null) return null;
    if (response != null) {
      userModel = userDetailsFromJson(response);
      print(userModel);
    }
  }

  getTotal() {
    dynamic total = 0;
    for (var item in _getCartProduct.cartModel) {
      //  print(item.producttotal);
      total = item.producttotal! + total;
    }
    return total;
  }
}
