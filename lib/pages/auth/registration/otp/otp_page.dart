import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mtest_app/components/otp_input_text_field.dart';
import 'package:mtest_app/pages/auth/controller/auth_controller.dart';
import 'package:mtest_app/theme/colors/support_colors.dart';
import 'package:mtest_app/theme/text_styles/text_styles.dart';
import 'package:mtest_app/utils/constants.dart';
import 'package:mtest_app/utils/dimensions.dart';

class OtpPage extends GetView<AuthController> {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title and description section
                  _titleDesc(),
                  verSpace(60),

                  /// Otp section
                  const OtpInputTextField(),
                  verSpace(12),

                  /// Resend secion
                  _resend(),
                ],
              ),
            ),

            /// Verify button
            _button(context),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
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
          'Confirm your phone',
          style: TextStyles.headlineMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        verSpace(4),
        Text(
          'We send 6 digits to +881 1720 84 57 57',
          style: TextStyles.headlineSmall.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _resend() {
    return Center(
      child: Text.rich(
        TextSpan(
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            height: 1.4,
          ),
          children: [
            TextSpan(
              text: 'Didn\'t get a code?',
              style: TextStyles.headlineSmall.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],
              ),
            ),
            TextSpan(
              text: ' Resend',
              style: const TextStyle(
                color: SupportColors.blue,
                fontSize: 14,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  controller.clearOtp();
                },
            ),
          ],
        ),
      ),
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
            onPressed: controller.isOtpComplete ? () {} : null,
            child: Text(
              'Verify Your Number',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: controller.isOtpComplete ? Colors.white : Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}
