import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:user_app/constant/const.dart';
import 'package:user_app/controller/get_all_store_products.dart';
import 'package:user_app/controller/search_all_store_controller.dart';
import 'package:user_app/views/screens/cart_screen.dart';
import 'package:user_app/views/widgets/product_card.dart';

class ProductScreen extends StatelessWidget {
  String shopeName;
  String storeId;
  ProductScreen({Key? key, required this.shopeName, required this.storeId})
      : super(key: key);

  final _getAllProductController = Get.find<GetAllShopeProductController>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        // flexibleSpace: const SizedBox(
        //   height: 100,
        // ),
        title: Text(shopeName),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(_size.height * 0.1),
          child: Container(
            // color: Colors.red,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  width: _size.width * 0.8,
                  height: 50,
                  child: TextFormField(
                    onChanged: (value) async {
                      Get.find<SearchAllStoreController>()
                          .searcInsideModel
                          .clear();
                      await Get.find<SearchAllStoreController>()
                          .searchInSideStore(
                              storeId: storeId, searchvalue: value);
                      Get.find<SearchAllStoreController>()
                          .update(["searchInsideStore"]);
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Search items",
                      filled: true,
                      prefixIconColor: Colors.black,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: FaIcon(FontAwesomeIcons.search),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await Get.to(CartScreen());
              },
              icon: const FaIcon(
                FontAwesomeIcons.cartArrowDown,
              ))
        ],
      ),
      body: GetBuilder<SearchAllStoreController>(
        id: "searchInsideStore",
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ProductCard(
                    allProducts: controller.searcInsideModel.isEmpty
                        ? _getAllProductController.resposeMode
                        : controller.searcInsideModel,
                    index: index,
                    storeId: storeId,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: controller.searcInsideModel.isEmpty
                    ? _getAllProductController.resposeMode.length
                    : controller.searcInsideModel.length),
          );
        },
      ),
    );
  }
}
