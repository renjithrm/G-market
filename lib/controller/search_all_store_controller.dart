import 'dart:developer';

import 'package:get/get.dart';
import 'package:user_app/constant/api_servics_links.dart';
import 'package:user_app/models/all_store_search_model.dart';
import 'package:user_app/models/get_all_product_model.dart';
import 'package:user_app/service/api_service.dart';

class SearchAllStoreController extends GetxController {
  final _apiService = ApiServics();
  final _apiLinks = ApiLink();
  List<SearchAllShopeModel> searchModel = [];

  List<GetAllProductModel> searcInsideModel = [];

  List<SearchAllShopeModel> allStoreAndProducts = [];

  // List<Product>? allProduct = [];

  // @override
  // void onInit() {
  //   getAllProductAllStore();
  //   super.onInit();
  // }

  Future searchItemAllStore({required String searchName}) async {
    var response = await _apiService
        .getRespose(_apiLinks.SEARCH_PRODUCT_ALL_STORE + searchName);

    if (response == null) return null;
    if (response != null) {
      searchModel = searchAllShopeModelFromJson(response);
      // searchModel.forEach((element) {
      //   print(":::::::${element.products}");
      // });
      print(searchModel);
    }
  }

  Future searchInSideStore(
      {required String storeId, required String searchvalue}) async {
    var response = await _apiService.getRespose(
        _apiLinks.SEARCH_PRODUCT_INSIDE_STORE + storeId + "/" + searchvalue);
    print(response);
    if (response == null) return null;
    if (response != null) {
      searcInsideModel = getAllProductModelFromJson(response);
      print(searcInsideModel);
    }
  }

  // Future getAllProductAllStore() async {
  //   var response =
  //       await _apiService.getRespose(_apiLinks.GET_ALL_PRODUCT_ALL_STORE);
  //   if (response == null) return null;
  //   if (response != null) {
  //     allStoreAndProducts = searchAllShopeModelFromJson(response);
  //     for (var item in allStoreAndProducts) {
  //       products = item.products;
  //       print(products);
  //     }
  //     print(products!.length);
  //   }
  // }
}
