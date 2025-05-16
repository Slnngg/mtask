import 'package:get/get.dart';

class SendController extends GetxController {
  RxInt selectedMethodIndex = (-1).obs;

  /// Selected receiver info
  RxString selectedReceiverName = ''.obs;
  RxString selectedReceiverEmail = ''.obs;
  RxString selectedReceiverImage = ''.obs;

  /// price
  RxString price = ''.obs;
  RxBool isCardSelected = false.obs;
  RxBool isPaid = false.obs;

  void selectReceiver(String name, String email, String imagePath) {
    selectedReceiverName.value = name;
    selectedReceiverEmail.value = email;
    selectedReceiverImage.value = imagePath;
  }

  @override
  void onClose() {
    isCardSelected.value = false;
    isPaid.value = false;
    super.onClose();
  }
}
