import 'package:barber_booking/app/modules/home/page.dart';
import 'package:barber_booking/app/modules/splash/page.dart';
import 'package:barber_booking/app/routes/routes.dart';
import 'package:get/get.dart';

import '../modules/authentication/page.dart';

class Pages {
  static final Routes _routes = Get.find();

  static final pages = <GetPage>[
    GetPage(name: _routes.initialRoute, page: () => SplashPage()),
    GetPage(name: _routes.homeRoute, page: () => HomePage()),
    GetPage(name: _routes.authRoute, page: () => AuthenticationPage()),
  ];
}
