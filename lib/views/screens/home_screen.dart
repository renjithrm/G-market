import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/constant/const.dart';
import 'package:user_app/controller/all_sotre_product_controller.dart';
import 'package:user_app/controller/get_all_store.dart';
import 'package:user_app/controller/get_builder_controller.dart';
import 'package:user_app/controller/get_cart_products.dart';
import 'package:user_app/controller/get_user_deatails_controller.dart';
import 'package:user_app/controller/get_user_location_controller.dart';
import 'package:user_app/controller/search_all_store_controller.dart';
import 'package:user_app/views/screens/all_shop_scree.dart';
import 'package:user_app/views/screens/cart_screen.dart';
import 'package:user_app/views/screens/profile_screen.dart';
import 'package:user_app/views/screens/search_all_stores_screen.dart';
import 'package:user_app/views/widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _controller = Get.put(Controller());
  final _getAllStoreController = Get.put(GetAllStoresController());
  final _getCartController = Get.put(GetCartProductController());
  final _getUserDetails = Get.put(GetUserdetails());

  final _searchAllStoreController = Get.put(SearchAllStoreController());

  final screen = [
    AllShopeScreen(),
    SearchFromAllStore(),
    ProfileScreen(),
  ];
  final _getUserLocation = Get.put(GetUserLoctionController());

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return GetBuilder<Controller>(
        id: "bottomScreen",
        builder: (_) {
          return Scaffold(
            // extendBodyBehindAppBar: true,
            appBar: AppBar(
              flexibleSpace: const SizedBox(height: 20),
              backgroundColor: primaryColor,
              shape: _controller.bottomIndex == 0
                  ? const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                      ),
                    )
                  : const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
              bottom: _controller.bottomIndex == 1
                  ? PreferredSize(
                      preferredSize: Size.fromHeight(_size.height * 0.1),
                      child: Container(
                        // color: Colors.red,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: _size.width * 0.8,
                              height: 50,
                              child: TextFormField(
                                onChanged: (value) async {
                                  await _searchAllStoreController
                                      .searchItemAllStore(searchName: value);
                                  _searchAllStoreController
                                      .update(["searchFromStore"]);
                                },
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: "Search items",
                                  filled: true,
                                  prefixIconColor: Colors.black,
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: FaIcon(FontAwesomeIcons.search),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : PreferredSize(
                      child: Container(),
                      preferredSize: const Size.fromHeight(30),
                    ),
              actions: [
                IconButton(
                  onPressed: () async {
                    dilogeBox(onPress: () async {
                      await _getUserLocation.getUserLocation();
                      if (_getUserLocation.position != null) {
                        Get.back();
                      }
                    });
                  },
                  icon: const FaIcon(Icons.location_on),
                ),
                IconButton(
                  onPressed: () async {
                    // navigatorKey.currentState?.pushNamed("/profile");
                    await Get.to(CartScreen());
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.cartPlus,
                  ),
                )
              ],
              title: Text(
                "G-Shope",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            extendBody: true,
            body: screen[_controller.bottomIndex],
            bottomNavigationBar: AppBottomNavbar(),
          );
        });
  }
}
