import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:user_app/constant/globel_keys.dart';
import 'package:user_app/service/shared_preference.dart';
import 'package:user_app/views/auth/wraper.dart';
import 'package:user_app/views/screens/home_screen.dart';
import 'package:user_app/views/screens/product_screen.dart';
import 'package:user_app/views/screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SaveId.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String? id = SaveId.getId();
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomeScreen(),
      routes: {
        "/home": (cntx) => HomeScreen(),
        "/swtich": (cntx) => Warper(),
        "/profile": (cntx) => ProfileScreen(),
      },
      initialRoute: id == null ? "/swtich" : "/home",
      debugShowCheckedModeBanner: false,
    );
  }
}

// class Init {
//   Init._();
//   static final instance = Init._();

//   Future splach() async {
//     Future.delayed(const Duration(seconds: 5));
//   }
// }
