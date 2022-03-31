import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CostumButton extends StatelessWidget {
  double height;
  double width;
  String text;
  Color? color;
  void Function()? onTap;
  CostumButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.text,
      this.color,
      this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: Container(
          width: width,
          height: height,
          child: Center(
              child: Text(
            text,
            style: GoogleFonts.roboto(
              fontSize: 20,
            ),
          )),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 139, 194, 240),
                  offset: Offset(4, 7),
                  blurRadius: 2,
                  spreadRadius: 2)
            ],
            color: color,
          ),
        ),
      ),
    );
  }
}
