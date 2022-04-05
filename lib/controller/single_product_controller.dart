import 'package:get/get.dart';
import 'package:user_app/constant/api_servics_links.dart';
import 'package:user_app/models/single_product_model.dart';
import 'package:user_app/service/api_service.dart';

class SingleProductController extends GetxController {
  final _apiService = ApiServics();
  final _apiLinks = ApiLink();

  Future<ProductDetailsModel?> getProductDetails(
      {required String storeId, required String productId}) async {
    var response = await _apiService
        .getRespose(_apiLinks.GET_SINGLE_PRODUCT + storeId + "/" + productId);

    if (response == null) return null;
    if (response != null) {
      var productDetail = productDetailsModelFromJson(response);
      print(productDetail);
      return productDetail;
    }
  }
}
