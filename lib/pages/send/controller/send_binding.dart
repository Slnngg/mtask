import 'package:get/get.dart';
import 'package:mtest_app/pages/send/controller/send_controller.dart';

class SendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SendController());
  }
}
