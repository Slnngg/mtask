import 'package:get/get.dart';

class AuthController extends GetxController {
  var phoneNumber = ''.obs;
  var password = ''.obs;
  var otpFields = List.generate(6, (index) => "").obs;

  bool get isOtpComplete => otpFields.every((field) => field.isNotEmpty);
  bool get isFormComplete => phoneNumber.isNotEmpty && password.isNotEmpty;

  void updateOtpField(int index, String value) {
    otpFields[index] = value;
  }

  void updatePhoneNumber(String value) {
    phoneNumber.value = value;
  }

  void updatePassword(String value) {
    password.value = value;
  }

  void clearOtp() {
    otpFields.assignAll(List.generate(6, (index) => ""));
  }
}
