// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/constant/const.dart';
import 'package:user_app/controller/get_user_order.dart';
import 'package:user_app/service/shared_preference.dart';
import 'package:user_app/views/screens/order_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final _getUserOrder = Get.put(GetUsetOrder());

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.center,
          width: _size.width,
          child: profile(context),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ListTile(
                leading: FaIcon(FontAwesomeIcons.signOutAlt),
                title: Text(
                  "Log Out",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  SaveId.delectId();
                  Navigator.of(context).restorablePushNamedAndRemoveUntil(
                      "/swtich", (route) => false);
                },
              ),
              ListTile(
                leading: FaIcon(
                  Icons.production_quantity_limits,
                ),
                title: Text(
                  "My Orders",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () async {
                  await Get.to(OrderScreen());
                },
              )
            ],
          ),
        )
      ],
    );
  }

  Widget profile(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showBottomSheets(
          onTapCamera: () {},
          onTapGallery: () {},
        );
      },
      child: Stack(
        children: [
          CircleAvatar(
            radius: 76,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 70,
              foregroundColor: Colors.black,
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/736x/a8/fa/9f/a8fa9f08cc0c4f291330739fe8fdc227.jpg"),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: FaIcon(
              FontAwesomeIcons.camera,
              size: 40,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
