import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/controller/get_all_store_products.dart';
import 'package:user_app/models/get_all_product_model.dart';
import 'package:user_app/models/get_all_stores_model.dart';
import 'package:user_app/views/screens/product_screen.dart';

class ShopCard extends StatelessWidget {
  List<GetAllStores> shopeList;
  int index;
  ShopCard({Key? key, required this.shopeList, required this.index})
      : super(key: key);

  final _getAllProduct = Get.put(GetAllShopeProductController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _getAllProduct.getAllProducts(shopeList[index].id ?? "");
        await Get.to(ProductScreen(
            shopeName: shopeList[index].storename ?? "All Products"));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: 200,
            height: 200,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Image(
                    width: 150,
                    height: 150,
                    // errorBuilder: (BuildContext context, Object error, _) {
                    //   return const Text("error");
                    // },
                    // loadingBuilder: (BuildContext context, Widget child, _) {
                    //   return const Center(
                    //     child: CircularProgressIndicator(),
                    //   );
                    // },
                    image: NetworkImage(shopeList[index].logo ?? ""),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                LimitedBox(
                  child: Text(
                    shopeList[index].storename ?? "",
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
