import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/constant/const.dart';
import 'package:user_app/constant/globel_keys.dart';
import 'package:user_app/controller/get_cart_products.dart';
import 'package:user_app/views/widgets/cart_card.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final _getCartController = Get.put(GetCartProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            "Cart",
            style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: GetBuilder<GetCartProductController>(
            id: "cartScreen",
            builder: (_) {
              return FutureBuilder(
                  future: _getCartController.getCartProduct(),
                  builder: (context, snapshot) {
                    return _getCartController.cartModel.isNotEmpty
                        ? ListView.separated(
                            itemBuilder: (context, index) {
                              return CartCardWidget(
                                index: index,
                                cartModel: _getCartController.cartModel,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 10,
                                ),
                            itemCount: _getCartController.cartModel.length)
                        : SizedBox(
                            child: Center(
                                child: Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 100,
                                ),
                                Image.asset("assets/cart_image.png"),
                                Text(
                                  "Add item to cart",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                )
                              ],
                            )),
                          );
                  });
            },
          ),
        ),
        floatingActionButton: GetBuilder<GetCartProductController>(
            id: "cartScreen",
            builder: (_) {
              return FutureBuilder(
                  future: _getCartController.getCartProduct(),
                  builder: (context, snapshot) {
                    return _getCartController.cartModel.isNotEmpty
                        ? FloatingActionButton.extended(
                            backgroundColor: primaryColor,
                            onPressed: () async {
                              await navigatorKey.currentState!
                                  .pushNamed("/payment");
                            },
                            label: Text(
                              "Buy Now",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold),
                            ))
                        : Container();
                  });
            }));
  }
}
