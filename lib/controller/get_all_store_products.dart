import 'package:get/get.dart';
import 'package:user_app/models/get_all_product_model.dart';
import 'package:user_app/service/api_service.dart';
import 'package:user_app/constant/api_servics_links.dart';

class GetAllShopeProductController extends GetxController {
  // String? storeId;

  // GetAllShopeProductController({this.storeId});

  final _apiService = ApiServics();
  final _apiLinks = ApiLink();
  List<GetAllProductModel> resposeMode = [];

  // @override
  // void onInit() {
  //   getAllProducts();
  //   super.onInit();
  // }

  Future getAllProducts(String storeId) async {
    var respose =
        await _apiService.getRespose(_apiLinks.GET_ALL_PRODUCTS + storeId);
    if (respose == null) return null;
    if (respose != null) {
      // print(respose);
      resposeMode = getAllProductModelFromJson(respose);
      // print(resposeMode.length);
    }
  }
}
