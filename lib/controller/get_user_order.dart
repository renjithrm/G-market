import 'package:get/get.dart';
import 'package:user_app/constant/api_servics_links.dart';

import 'package:user_app/models/order_model.dart';
import 'package:user_app/service/api_service.dart';
import 'package:user_app/service/shared_preference.dart';

class GetUsetOrder extends GetxController {
  final _apiLink = ApiLink();
  final _apiServise = ApiServics();
  final userId = SaveId.getId();
  List<GetUserOrder> accepted = [];
  List<GetUserOrder> pending = [];
  List<GetUserOrder> canceled = [];

  @override
  void onInit() {
    getUserOrder();
    super.onInit();
  }

  Future getUserOrder() async {
    var response =
        await _apiServise.getRespose(_apiLink.GET_ORDER_USER + userId);
    if (response == null) return null;
    var responseModel = getUserOrderFromJson(response);
    // print(responseModel[0].status);

    // for (var item in responseModel) {
    //   switch (item.status) {
    //     case "accepted":
    //       accepted.add(item);
    //       print("accepted:: ${canceled[0].status}");
    //       break;
    //     case "canceled":
    //       canceled.add(item);
    //       print("cencel:: ${canceled[0].address}");
    //       break;
    //     default:
    //       pending.add(item);
    //       print("pending:: ${canceled[0].address}");
    //   }
    // }
  }
}
