import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controller/all_sotre_product_controller.dart';
import 'package:user_app/controller/search_all_store_controller.dart';
import 'package:user_app/views/widgets/search_card_widget.dart';

class SearchFromAllStore extends StatelessWidget {
  SearchFromAllStore({Key? key}) : super(key: key);
  final _getAllProduct = Get.put(GetAllProductAllStore());
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GetBuilder<SearchAllStoreController>(
            id: "searchFromStore",
            builder: (controller) {
              return controller.searchModel.isNotEmpty
                  ? ListView.separated(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemBuilder: ((context, index) {
                        //  return Container();
                        var widget = controller.searchModel[index].products!
                            .map((item) => SearchCardWiget(
                                  index: index,
                                  image: item.image1 ??
                                      "https://i.pinimg.com/564x/ab/ca/4c/abca4c51c7e166b2980105b5e98b7ac2.jpg",
                                  productName: item.productname ?? "error",
                                  price: item.amount.toString(),
                                  units: item.units.toString(),
                                  storeName: controller.searchModel[index]
                                          .store!.storename ??
                                      "error",
                                ))
                            .toList();

                        log(widget.toString());

                        return Column(
                          children: widget,
                        );
                      }),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: controller.searchModel.length)
                  : ListView.separated(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemBuilder: (context, index) {
                        var widget =
                            _getAllProduct.allStoreAndProducts[index].products!
                                .map((item) => SearchCardWiget(
                                      index: index,
                                      image: item.image1 ??
                                          "https://i.pinimg.com/564x/ab/ca/4c/abca4c51c7e166b2980105b5e98b7ac2.jpg",
                                      productName: item.productname ?? "error",
                                      price: item.amount.toString(),
                                      units: item.units.toString(),
                                      storeName: _getAllProduct
                                              .allStoreAndProducts[index]
                                              .store!
                                              .storename ??
                                          "error",
                                    ))
                                .toList();

                        log(widget.toString());

                        return Column(
                          children: widget,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: _getAllProduct.allStoreAndProducts.length);
            }));
  }
}
