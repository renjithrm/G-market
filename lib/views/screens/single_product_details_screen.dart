import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_deck/swipe_deck.dart';
import 'package:user_app/constant/const.dart';
import 'package:user_app/models/get_all_product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  List<GetAllProductModel> allProducts;
  int index;
  ProductDetailsScreen(
      {Key? key, required this.allProducts, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    final widgetList = [
      Image(
        width: _size.width * 0.8,
        height: _size.height * 0.4,
        image: NetworkImage(allProducts[index].image1 ??
            "https://i.pinimg.com/564x/0c/1b/11/0c1b113aca1fd52110dd07162e319895.jpg"),
        fit: BoxFit.cover,
      ),
      Image(
        width: _size.width * 0.8,
        height: _size.height * 0.4,
        image: NetworkImage(allProducts[index].image2 ??
            "https://i.pinimg.com/564x/0c/1b/11/0c1b113aca1fd52110dd07162e319895.jpg"),
        fit: BoxFit.cover,
      ),
      Image(
        width: _size.width * 0.8,
        height: _size.height * 0.4,
        image: NetworkImage(allProducts[index].image3 ??
            "https://i.pinimg.com/564x/0c/1b/11/0c1b113aca1fd52110dd07162e319895.jpg"),
        fit: BoxFit.cover,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(allProducts[index].productname ?? "Product name"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              width: _size.width,
              height: _size.height * 0.4,
              alignment: Alignment.center,
              child: SwipeDeck(
                widgets: widgetList,
                cardSpreadInDegrees: 18.0,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              allProducts[index].productname ?? "Product name",
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "${allProducts[index].description}",
              style: GoogleFonts.roboto(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Product Details",
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            rowDetails(
              price: "${allProducts[index].amount} Rs",
              quantity: "${allProducts[index].units}",
              units: "${allProducts[index].units} left",
              categorys: "${allProducts[index].category}",
              expired: "${allProducts[index].exprmonths}",
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: _size.width * 0.4,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => states.contains(MaterialState.pressed)
                          ? Colors.grey
                          : primaryColor,
                    )),
                    onPressed: () {},
                    child: const Text("Buy now"),
                  ),
                ),
                Container(
                  width: _size.width * 0.4,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => states.contains(MaterialState.pressed)
                          ? Colors.grey
                          : primaryColor,
                    )),
                    onPressed: () {},
                    child: const Text("Add to cart"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget rowDetails({
    required String price,
    required String quantity,
    required String units,
    required String categorys,
    required String expired,
  }) {
    return Table(
      children: [
        TableRow(children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Price : ",
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    price,
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Category : ",
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    categorys,
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Quantity : ",
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    quantity,
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Units : ",
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    units,
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Expir months : ",
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    quantity,
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ],
          )
        ])
      ],
    );
  }
}
