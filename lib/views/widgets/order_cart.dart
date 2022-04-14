import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderCard extends StatelessWidget {
  OrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Card(
      child: ExpandablePanel(
          header: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "open",
                style: GoogleFonts.roboto(
                  fontSize: 20,
                ),
              )),
          collapsed: Container(
            height: _size.height * 0.2,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Image(
                  width: _size.width * 0.2,
                  image: NetworkImage(
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
                          "error",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text("Total item :",
                          style: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 17,
                          )),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Price :  Rs",
                        style: GoogleFonts.roboto(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          expanded: Container(
            height: _size.height * 0.3,
            child: Stepper(steps: [
              Step(
                  title: Text("pending"),
                  content: Text("requst sent to shope")),
              Step(
                  title: Text("pending"),
                  content: Text("requst sent to shope")),
              Step(
                  title: Text("pending"), content: Text("requst sent to shope"))
            ]),
          )),
    );
  }
}
