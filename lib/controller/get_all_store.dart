import 'package:get/get.dart';
import 'package:user_app/constant/api_servics_links.dart';
import 'package:user_app/models/get_all_stores_model.dart';
import 'package:user_app/service/api_service.dart';

class GetAllStoresController extends GetxController {
  final _apiService = ApiServics();
  final _apiLinks = ApiLink();

  var shopeList = <GetAllStores>[];

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  Future getAllProducts() async {
    var response = await _apiService.getRespose(_apiLinks.GET_ALL_STORE);
    if (response == null) return null;
    if (response != null) {
      var responseModel = getAllStoresFromJson(response.toString());
      shopeList = responseModel;
      //print(responseModel);
    }
    update(["getAllShope"]);
  }
}
