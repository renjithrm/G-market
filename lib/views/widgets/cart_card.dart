import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/constant/const.dart';
import 'package:user_app/controller/cart_items_controller.dart';
import 'package:user_app/controller/get_cart_products.dart';
import 'package:user_app/models/get_all_cart_model.dart';

class CartCardWidget extends StatelessWidget {
  int index;
  List<GetAllCartProducts> cartModel;
  CartCardWidget({Key? key, required this.index, required this.cartModel})
      : super(key: key);

  final _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () async {},
      child: Card(
        child: Container(
          height: _size.height * 0.25,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Image(
                width: _size.width * 0.4,
                image: NetworkImage(cartModel[index].image ??
                    "https://i.pinimg.com/564x/09/5b/81/095b81683fdab4c1504c5b9c0ccb1dc5.jpg"),
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 19.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        cartModel[index].productname ?? "error",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GetBuilder<GetCartProductController>(
                        id: "cartTotalItem",
                        builder: (controller) {
                          return FutureBuilder(
                              future: controller.getCartProduct(),
                              builder: (context, snapshot) {
                                return Text(
                                  "Total item : ${controller.cartModel[index].noofitems}",
                                  style: GoogleFonts.roboto(
                                    color: Colors.grey,
                                    fontSize: 17,
                                  ),
                                );
                              });
                        }),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GetBuilder<GetCartProductController>(
                      id: "cartTotalItem",
                      builder: (controller) {
                        return FutureBuilder(
                            future: controller.getCartProduct(),
                            builder: (context, snapshot) {
                              return Text(
                                "Price : ${controller.cartModel[index].producttotal} Rs",
                                style: GoogleFonts.roboto(
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                              );
                            });
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Flexible(
                      child: Container(
                          width: _size.width * 0.4,
                          alignment: Alignment.bottomRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              GetBuilder<GetCartProductController>(
                                id: "cartDecreMent",
                                builder: (controller) {
                                  return FutureBuilder(
                                      future: controller.getCartProduct(),
                                      builder: (context, snapshot) {
                                        return controller.cartModel[index]
                                                    .noofitems! >
                                                1
                                            ? InkWell(
                                                onTap: () async {
                                                  await _cartController
                                                      .decrementCartItem(
                                                          productId: cartModel[
                                                                      index]
                                                                  .productid ??
                                                              "");
                                                  Get.find<
                                                          GetCartProductController>()
                                                      .update([
                                                    "cartTotalItem",
                                                    "cartDecreMent"
                                                  ]);
                                                },
                                                child: Container(
                                                  width: 50,
                                                  height: 33,
                                                  child: const Center(
                                                    child: FaIcon(
                                                      Icons.remove,
                                                      color: Colors.white,
                                                      size: 30,
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
                                                          productId: Get.find<
                                                                      GetCartProductController>()
                                                                  .cartModel[
                                                                      index]
                                                                  .productid ??
                                                              "");
                                                  Get.find<
                                                          GetCartProductController>()
                                                      .update(["cartScreen"]);
                                                },
                                                child: Container(
                                                  width: 50,
                                                  height: 33,
                                                  child: const Center(
                                                    child: FaIcon(
                                                      Icons.remove,
                                                      color: Colors.white,
                                                      size: 30,
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
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () async {
                                  await _cartController.incrementCartItem(
                                      productId:
                                          cartModel[index].productid ?? "");
                                  Get.find<GetCartProductController>().update(
                                      ["cartTotalItem", "cartDecreMent"]);
                                },
                                child: Container(
                                  width: 50,
                                  height: 33,
                                  child: const Center(
                                    child: FaIcon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                            ],
                          )),
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
