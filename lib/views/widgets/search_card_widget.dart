import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/constant/enums.dart';
import 'package:user_app/controller/cart_items_controller.dart';
import 'package:user_app/controller/get_all_store_products.dart';
import 'package:user_app/controller/search_all_store_controller.dart';
import 'package:user_app/controller/single_product_controller.dart';
import 'package:user_app/models/all_store_search_model.dart';
import 'package:user_app/views/screens/single_product_details_screen.dart';

class SearchCardWiget extends StatelessWidget {
  int index;
  String? productId;
  String image;
  String productName;
  String price;
  String units;
  Store store;
  SearchCardWiget({
    Key? key,
    required this.index,
    required this.image,
    required this.productName,
    required this.price,
    required this.units,
    required this.store,
    this.productId,
  }) : super(key: key);

  final _searchController = Get.find<SearchAllStoreController>();

  final _cartController = Get.put(CartController());
  final _singleProductDetails = Get.put(SingleProductController());

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    //   var image = _searchController.allStoreAndProducts[index].products!

    return GestureDetector(
      onTap: () async {
        var productDetails = await _singleProductDetails.getProductDetails(
            storeId: store.id ?? "", productId: productId ?? "");
        if (productId == null) return;
        await Get.find<GetAllShopeProductController>()
            .getAllProducts(store.id ?? "");
        await Get.to(ProductDetailsScreen(
          productDetail: productDetails!,
          screen: SingleProductScreen.allProductsScreen,
          allProducts: Get.find<GetAllShopeProductController>().resposeMode,
        ));
      },
      child: Card(
        child: Container(
          height: _size.height * 0.25,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Image(
                width: _size.width * 0.4,
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 19.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      productName,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Price :$price Rs",
                      style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      store.storename.toString(),
                      style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "$units left",
                      style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
