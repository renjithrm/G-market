import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/constant/const.dart';
import 'package:user_app/controller/order_controller.dart';
import 'package:user_app/views/widgets/order_cart.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);

  final _orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Orders",
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        width: _size.width,
        height: _size.height,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Column(
                  children: _orderController.orderModel![index].products!
                      .map((element) {
                return OrderCard(
                  index: index,
                  image: element.image,
                  totalItem: element.producttotal!,
                  price: _orderController.orderModel![index].totalamount!,
                  status: _orderController.orderModel![index].status.toString(),
                  productName: element.productname.toString(),
                );
              }).toList());
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: _orderController.orderModel!.length),
      ),
    );
  }
}
