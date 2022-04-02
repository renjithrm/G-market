import 'package:get/get.dart';
import 'package:user_app/constant/api_servics_links.dart';
import 'package:user_app/models/all_store_search_model.dart';
import 'package:user_app/service/api_service.dart';

class GetAllProductAllStore extends GetxController {
  final _apiService = ApiServics();
  final _apiLinks = ApiLink();

  List<SearchAllShopeModel> allStoreAndProducts = [];

  @override
  void onInit() {
    getAllProductAllStore();
    super.onInit();
  }

  Future getAllProductAllStore() async {
    var response =
        await _apiService.getRespose(_apiLinks.GET_ALL_PRODUCT_ALL_STORE);
    if (response == null) return null;
    if (response != null) {
      allStoreAndProducts = searchAllShopeModelFromJson(response);
    }
  }
}
