import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controller/get_all_store.dart';
import 'package:user_app/controller/search_all_store_controller.dart';

import 'package:user_app/views/widgets/shop_card.dart';

class AllShopeScreen extends StatelessWidget {
  AllShopeScreen({Key? key}) : super(key: key);

  final _getAllShope = Get.find<GetAllStoresController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<GetAllStoresController>(
            id: "getAllShope",
            builder: (_) {
              return FutureBuilder(
                  future: _getAllShope.getAllProducts(),
                  builder: (context, snapshot) {
                    return GridView.builder(
                      itemCount: _getAllShope.shopeList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        // Get.find<SearchAllStoreController>().index = index;
                        return ShopCard(
                            shopeList: _getAllShope.shopeList, index: index);
                      },
                    );
                  });
            }));
  }
}
