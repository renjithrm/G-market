import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/constant/const.dart';
import 'package:user_app/controller/cart_items_controller.dart';
import 'package:user_app/controller/get_cart_products.dart';
import 'package:user_app/controller/search_all_store_controller.dart';

class SearchCardWiget extends StatelessWidget {
  int index;
  SearchCardWiget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final _searchController = Get.find<SearchAllStoreController>();

  final _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return GestureDetector(
      // onTap: () async {
      //   await Get.to(ProductDetailsScreen(
      //       allProducts: _searchController.searchModel[index].products ?? [],
      //       index: index));
      // },
      child: Card(
        child: Container(
          height: _size.height * 0.25,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Image(
                width: _size.width * 0.4,
                image: NetworkImage(_searchController
                        .searchModel[index].products?[0].image1 ??
                    "https://i.pinimg.com/564x/0c/1b/11/0c1b113aca1fd52110dd07162e319895.jpg"),
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
                      _searchController
                              .searchModel[index].products?[0].productname ??
                          "error",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Price :${_searchController.searchModel[index].products?[0].amount} Rs",
                      style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      _searchController.searchModel[index].store?.storename ??
                          "error",
                      style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${_searchController.searchModel[index].products?[0].units} left",
                      style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                    Flexible(
                      child: Container(
                          width: _size.width * 0.4,
                          alignment: Alignment.bottomRight,
                          child: GetBuilder<GetCartProductController>(
                              id: "cartButton",
                              builder: (controller) {
                                return FutureBuilder(
                                    future: controller.getCartProduct(),
                                    builder: (context, snapshot) {
                                      return controller.cartModel
                                              .where((element) =>
                                                  element.productid ==
                                                  _searchController
                                                      .searchModel[index]
                                                      .products?[0]
                                                      .id)
                                              .isEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                await _cartController
                                                    .addItemToCart(
                                                        _searchController
                                                            .searchModel[index]
                                                            .store!
                                                            .id
                                                            .toString(),
                                                        _searchController
                                                                .searchModel[
                                                                    index]
                                                                .products?[0]
                                                                .id ??
                                                            "");
                                                Get.find<
                                                        GetCartProductController>()
                                                    .update([
                                                  "cartScreen",
                                                  "cartButton"
                                                ]);
                                                Get.snackbar(
                                                    _searchController
                                                            .searchModel[index]
                                                            .products?[0]
                                                            .productname ??
                                                        "Product",
                                                    "add to cart");
                                              },
                                              child: Container(
                                                width: 50,
                                                height: 33,
                                                child: Center(
                                                  child: Text(
                                                    "Add",
                                                    style: GoogleFonts.roboto(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () async {
                                                await _cartController
                                                    .delectFromCart(
                                                        productId:
                                                            _searchController
                                                                    .searchModel[
                                                                        index]
                                                                    .products?[
                                                                        0]
                                                                    .id ??
                                                                "");
                                                Get.find<
                                                        GetCartProductController>()
                                                    .update([
                                                  "cartScreen",
                                                  "cartButton"
                                                ]);
                                                Get.snackbar(
                                                    _searchController
                                                            .searchModel[index]
                                                            .products?[0]
                                                            .productname ??
                                                        "Product",
                                                    "Delect from cart");
                                              },
                                              child: Container(
                                                width: 50,
                                                height: 33,
                                                child: Center(
                                                  child: Text(
                                                    "Delect",
                                                    style: GoogleFonts.roboto(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                              ),
                                            );
                                    });
                              })),
                    )
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
