import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mtest_app/pages/send/controller/send_controller.dart';
import 'package:mtest_app/routes/route_names.dart';
import 'package:mtest_app/theme/colors/support_colors.dart';
import 'package:mtest_app/theme/text_styles/text_styles.dart';
import 'package:mtest_app/utils/constants.dart';
import 'package:mtest_app/utils/dimensions.dart';

class PaymentMethodView extends GetView<SendController> {
  const PaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SupportColors.backgroundColor,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title and description section
                    _titleDesc(),
                    verSpace(18),

                    /// Receiver info section
                    _receiverInfo(),

                    verSpace(24),

                    /// Choose account (card)
                    _chooseAccount(),
                  ],
                ),
              ),
            ),

            /// Pay button OR Paid button
            Obx(() {
              return controller.isPaid.value ? _paidButton() : _button(context);
            }),
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
          Text(
            controller.selectedReceiverName.value,
            style: TextStyles.titleLarge.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            controller.selectedReceiverEmail.value,
            style: TextStyles.titleSmall.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          controller.isPaid.value
              ? Text(
                  'Coinpay Transaction ID: ABC1234X',
                  style: TextStyles.titleSmall.copyWith(
                    fontWeight: FontWeight.w400,
                    color: SupportColors.blue,
                  ),
                )
              : Container(),
          verSpace(12),
        ],
      ),
    );
  }

  Widget _chooseAccount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose Account',
          style: TextStyles.titleLarge.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        Obx(
          () => InkWell(
            onTap: () {
              controller.isCardSelected.value =
                  !controller.isCardSelected.value;
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: Dimensions.borderRadius12,
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: SupportColors.backgroundColor,
                        width: 1,
                      ),
                      borderRadius: Dimensions.borderRadius6,
                    ),
                    child: Image.asset(
                      'assets/images/master_card.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  horSpace(12),
                  Row(
                    children: [
                      Text(
                        'Account',
                        style: TextStyles.titleSmall.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      horSpace(6),
                      Text(
                        '************9911',
                        style: TextStyles.titleSmall.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    controller.isCardSelected.value == true
                        ? 'assets/images/fill_circle.png'
                        : 'assets/images/empty_circle.png',
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _button(BuildContext context) {
    return SizedBox(
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
            onPressed:
                controller.isCardSelected.value && controller.price.value != ''
                    ? () {
                        controller.isPaid.value = true;
                        Get.snackbar(
                          '',
                          'Transaction Complete! - ${DateFormat("d, MMMM y 'at' hh:mm a").format(DateTime.now())}',
                          backgroundColor: Colors.green.withOpacity(0.4),
                          colorText: Colors.green,
                          snackPosition: SnackPosition.TOP,
                          margin: const EdgeInsets.all(16),
                          borderRadius: 12,
                          duration: const Duration(seconds: 2),
                        );
                      }
                    : null,
            child: Text(
              controller.price.value != ''
                  ? 'Pay \$${controller.price.value}'
                  : 'Pay',
              style: TextStyles.titleMedium.copyWith(
                color: controller.isCardSelected.value
                    ? Colors.white
                    : Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _paidButton() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: SupportColors.blue,
              shape: const RoundedRectangleBorder(
                borderRadius: Dimensions.borderRadius50,
              ),
              elevation: 0,
            ),
            onPressed: () {
              Get.toNamed(RouteNames.homePage);
            },
            child: Text(
              'Back to Homepage',
              style: TextStyles.titleMedium.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
        verSpace(12),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: Dimensions.borderRadius50,
                side: BorderSide(
                  color: SupportColors.blue,
                  width: 2,
                ),
              ),
            ),
            onPressed: () {
              Get.toNamed(RouteNames.send);
            },
            child: const Text(
              'Make another Payment',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: SupportColors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
