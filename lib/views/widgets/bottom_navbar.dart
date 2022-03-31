import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:user_app/controller/get_builder_controller.dart';

class AppBottomNavbar extends StatelessWidget {
  AppBottomNavbar({Key? key}) : super(key: key);

  final item = [
    const FaIcon(
      FontAwesomeIcons.store,
      size: 22,
      color: Colors.black,
    ),
    const FaIcon(
      Icons.category,
      size: 23,
      color: Colors.black,
    ),
    const FaIcon(
      Icons.person,
      size: 22,
      color: Colors.black,
    ),
  ];

  final _controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      id: "bottomScreen",
      builder: (_) {
        return CurvedNavigationBar(
          items: item,
          backgroundColor: Colors.transparent,
          color: const Color(0xff008352),
          animationDuration: const Duration(milliseconds: 300),
          // animationCurve: Curves.easeInCirc,
          height: 65,
          index: _controller.bottomIndex,
          onTap: (value) {
            _controller.bottomIndex = value;
            _controller.update(["bottomScreen"]);
          },
          letIndexChange: (value) {
            return true;
          },
        );
      },
    );
  }
}
