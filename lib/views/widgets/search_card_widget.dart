import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/controller/cart_items_controller.dart';
import 'package:user_app/controller/search_all_store_controller.dart';
import 'package:user_app/models/all_store_search_model.dart';

class SearchCardWiget extends StatelessWidget {
  int index;

  String image;
  String productName;
  String price;
  String units;
  String storeName;
  SearchCardWiget(
      {Key? key,
      required this.index,
      required this.image,
      required this.productName,
      required this.price,
      required this.units,
      required this.storeName})
      : super(key: key);

  final _searchController = Get.find<SearchAllStoreController>();

  final _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    //   var image = _searchController.allStoreAndProducts[index].products!

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
                      storeName,
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
