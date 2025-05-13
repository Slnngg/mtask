import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SplashController extends GetxController {
  RxInt currentPage = 0.obs;
  final PageController pageController = PageController();

  final List<String> splashImages = [
    "assets/images/splash_1.svg",
    "assets/images/splash_2.svg",
    "assets/images/splash_3.svg",
  ];

  final List<String> splashTitles = [
    "Trusted by millions of people, part of one part",
    "Spend money abroad, and track your expense",
    "Receive Money\nFrom Anywhere In\nThe World",
  ];

  void setPage(int index) {
    currentPage.value = index;
  }
}
