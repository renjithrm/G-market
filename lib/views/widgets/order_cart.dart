import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/controller/order_controller.dart';

class OrderCard extends StatelessWidget {
  int index;
  String? image;
  int totalItem;
  String status;
  int price;
  String productName;
  OrderCard(
      {Key? key,
      required this.index,
      this.image,
      required this.totalItem,
      required this.price,
      required this.status,
      required this.productName})
      : super(key: key);
  final _getOrderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        height: _size.height * 0.2,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Image(
              width: _size.width * 0.2,
              image: NetworkImage(image ??
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
                      productName,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text("Total item :$totalItem",
                      style: GoogleFonts.roboto(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Total Price : $price Rs",
                    style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Status : $status ",
                    style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
