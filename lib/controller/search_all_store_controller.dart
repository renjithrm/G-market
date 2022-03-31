import 'package:get/get.dart';
import 'package:user_app/constant/api_servics_links.dart';
import 'package:user_app/models/all_store_search_model.dart';
import 'package:user_app/service/api_service.dart';

class SearchAllStoreController extends GetxController {
  final _apiService = ApiServics();
  final _apiLinks = ApiLink();
  List<SearchAllShopeModel> searchModel = [];

  Future searchItemAllStore({required String searchName}) async {
    var response = await _apiService
        .getRespose(_apiLinks.SEARCH_PRODUCT_ALL_STORE + searchName);
    // print(response);
    if (response == null) return null;
    if (response != null) {
      searchModel = searchAllShopeModelFromJson(response);
      // print(searchModel);
    }
  }
}
