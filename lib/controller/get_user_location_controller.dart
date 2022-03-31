import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GetUserLoctionController extends GetxController {
  // double latitude = 0;
  // double longitude = 0;
  Position? position;

  @override
  void onInit() {
    getUserLocation();
    super.onInit();
  }

  @override
  void dispose() {
    getUserLocation();
    super.dispose();
  }

  Future getUserLocation() async {
    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    } else {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position?.latitude);
      print(position?.longitude);
    }
  }
}
