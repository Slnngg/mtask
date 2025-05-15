import 'package:get/get.dart';

class SendController extends GetxController {
  RxInt selectedMethodIndex = (-1).obs;

  var selectedReceiverName = ''.obs;
  var selectedReceiverEmail = ''.obs;
  var selectedReceiverImage = ''.obs;

  void selectReceiver(String name, String email, String imagePath) {
    selectedReceiverName.value = name;
    selectedReceiverEmail.value = email;
    selectedReceiverImage.value = imagePath;
  }
}
