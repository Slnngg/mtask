import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtest_app/pages/send/controller/send_controller.dart';
import 'package:mtest_app/routes/route_names.dart';
import 'package:mtest_app/theme/colors/support_colors.dart';
import 'package:mtest_app/theme/text_styles/text_styles.dart';
import 'package:mtest_app/utils/constants.dart';
import 'package:mtest_app/utils/dimensions.dart';

class MethodViewPage extends GetView<SendController> {
  const MethodViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final priceController = TextEditingController();

    return Scaffold(
      backgroundColor: SupportColors.backgroundColor,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title and description section
              _titleDesc(),
              verSpace(18),

              /// Receiver info section and continue button
              _receiverInfo(priceController),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: SupportColors.backgroundColor,
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back_ios_new,
          size: 16,
        ),
      ),
    );
  }

  Widget _titleDesc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select a Purpose',
          style: TextStyles.headlineMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        verSpace(4),
        Text(
          'Select a Method for Sending Money',
          style: TextStyles.headlineSmall.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _receiverInfo(TextEditingController priceController) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: Dimensions.borderRadius12,
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(10),
            child: ClipOval(
              child: Image.asset(
                controller.selectedReceiverImage.value,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          horSpace(10),
          Text(
            controller.selectedReceiverName.value,
            style: TextStyles.titleLarge.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          verSpace(4),
          Text(
            controller.selectedReceiverEmail.value,
            style: TextStyles.titleSmall.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          verSpace(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/us.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              horSpace(4),
              const Icon(
                Icons.arrow_downward,
                size: 12,
              )
            ],
          ),
          verSpace(4),
          SizedBox(
            width: 140,
            child: TextFormField(
              controller: priceController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              onChanged: (value) {
                controller.price.value = value;
              },
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                counterText: "",
                contentPadding: const EdgeInsets.only(bottom: 8),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
            ),
          ),
          verSpace(36),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            height: 56,
            child: Obx(
              () {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: SupportColors.blue,
                    shape: const RoundedRectangleBorder(
                      borderRadius: Dimensions.borderRadius50,
                    ),
                    elevation: 0,
                  ),
                  onPressed: controller.price.value != ''
                      ? () {
                          Get.toNamed(RouteNames.paymentMethodView);
                        }
                      : null,
                  child: Text(
                    'Continue',
                    style: TextStyles.titleMedium.copyWith(
                      color: controller.price.value != ''
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
