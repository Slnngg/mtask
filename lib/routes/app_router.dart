// ignore_for_file: prefer_const_constructors

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mtest_app/pages/splash/controller/splash_binding.dart';
import 'package:mtest_app/pages/splash/splash_screen.dart';
import 'package:mtest_app/routes/route_names.dart';
import 'package:get/get.dart';

class AppRouter {
  static final List<GetPage> routes = [
    GetPage(
      name: '/${RouteNames.splash}',
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
  ];
}
