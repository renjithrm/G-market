import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/constant/const.dart';
import 'package:user_app/controller/cart_items_controller.dart';
import 'package:user_app/controller/get_cart_products.dart';
import 'package:user_app/models/get_all_product_model.dart';
import 'package:user_app/views/screens/single_product_details_screen.dart';

class ProductCard extends StatelessWidget {
  List<GetAllProductModel> allProducts;
  int index;

  ProductCard({
    Key? key,
    required this.allProducts,
    required this.index,
  }) : super(key: key);

  final _cartController = Get.put(CartController());
  final _getCartProduct = Get.find<GetCartProductController>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
        await Get.to(ProductDetailsScreen(
          allProducts: allProducts,
          index: index,
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
                image: NetworkImage(allProducts[index].image1 ??
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
                      allProducts[index].productname ?? "error",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      allProducts[index].category ?? "error",
                      style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      allProducts[index].amount.toString(),
                      style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${allProducts[index].units} left",
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
                              builder: (_) {
                                return FutureBuilder(
                                    future: _getCartProduct.getCartProduct(),
                                    builder: (context, snapshot) {
                                      return _getCartProduct.cartModel
                                              .where((element) =>
                                                  element.productid ==
                                                  allProducts[index].id)
                                              .isEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                await _cartController
                                                    .addItemToCart(
                                                        allProducts[index]
                                                            .storeid
                                                            .toString(),
                                                        allProducts[index]
                                                            .id
                                                            .toString());
                                                Get.find<
                                                        GetCartProductController>()
                                                    .update([
                                                  "cartScreen",
                                                  "cartButton"
                                                ]);
                                                Get.snackbar(
                                                    allProducts[index]
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
                                                            allProducts[index]
                                                                    .id ??
                                                                "");
                                                Get.find<
                                                        GetCartProductController>()
                                                    .update([
                                                  "cartScreen",
                                                  "cartButton"
                                                ]);
                                                Get.snackbar(
                                                    allProducts[index]
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
