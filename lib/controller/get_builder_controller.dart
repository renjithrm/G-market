import 'package:get/get.dart';

class Controller extends GetxController {
  bool obscureText = true;
  bool loginPage = true;
  int bottomIndex = 0;

  togglePage() {
    loginPage = !loginPage;
    update(["toggle"]);
  }
}
