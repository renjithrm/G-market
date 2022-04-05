import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color(0xff008352);

final requriedValidation =
    RequiredValidator(errorText: "This field is requried");

showBottomSheets({
  void Function()? onTapCamera,
  void Function()? onTapGallery,
}) async {
  return Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      height: 150,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: onTapCamera,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: const Center(
                child: FaIcon(FontAwesomeIcons.camera),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: onTapGallery,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: const Center(
                child: FaIcon(FontAwesomeIcons.image),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

dilogeBox({required void Function() onPress}) {
  return Get.dialog(Dialog(
    child: Container(
      width: 200,
      height: 170,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            "Select your location",
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton.icon(
              onPressed: onPress,
              icon: const FaIcon(Icons.location_on),
              label: const Text("Find location")),
          Container(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Close"),
            ),
          ),
        ],
      ),
    ),
  ));
}

Widget formField(
    {TextEditingController? controller,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    String? hindText,
    Icon? icon,
    Widget? suffixIcon,
    bool? obscureText}) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 8,
      bottom: 8,
    ),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20)),
          filled: true,
          fillColor: Colors.grey[400],
          hintText: hindText,
          prefixIcon: icon,
          suffixIcon: suffixIcon),
      obscureText: obscureText ?? false,
    ),
  );
}
