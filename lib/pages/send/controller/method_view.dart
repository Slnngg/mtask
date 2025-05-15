import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtest_app/pages/send/controller/send_controller.dart';
import 'package:mtest_app/theme/colors/support_colors.dart';
import 'package:mtest_app/theme/text_styles/text_styles.dart';
import 'package:mtest_app/utils/constants.dart';
import 'package:mtest_app/utils/dimensions.dart';

class MethodViewPage extends GetView<SendController> {
  const MethodViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SupportColors.backgroundColor,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title and description section
                _titleDesc(),
                verSpace(18),

                /// Receiver info section
                _receiverInfo(),
              ],
            ),
          ],
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

  Widget _receiverInfo() {
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
          Text(controller.selectedReceiverName.value),
          Text(controller.selectedReceiverEmail.value),
        ],
      ),
    );
  }
}
