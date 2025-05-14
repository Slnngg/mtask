import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxString phoneNumber = ''.obs;
  RxString password = ''.obs;
  var otpFields = List.generate(6, (index) => "").obs;

  /// Account info
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  RxString email = ''.obs;
  RxString address = ''.obs;
  RxString city = ''.obs;
  RxString postCode = ''.obs;
  RxString fullName = ''.obs;
  RxString userName = ''.obs;
  Rxn<DateTime> dateOfBirth = Rxn<DateTime>();
  RxString selectedCountry = 'Mongolia'.obs;

  bool get isOtpComplete => otpFields.every((field) => field.isNotEmpty);
  bool get isFormComplete => phoneNumber.isNotEmpty && password.isNotEmpty;

  void updateOtpField(int index, String value) {
    otpFields[index] = value;
  }

  void clearOtp() {
    otpFields.assignAll(List.generate(6, (index) => ""));
  }

  void nextPage() {
    if (currentPage.value < 3) {
      pageController.animateToPage(
        currentPage.value + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      currentPage.value++;
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
