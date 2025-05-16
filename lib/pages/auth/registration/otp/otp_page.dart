import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mtest_app/components/custom_widgets.dart';
import 'package:mtest_app/components/otp_input_text_field.dart';
import 'package:mtest_app/pages/auth/controller/auth_controller.dart';
import 'package:mtest_app/routes/route_names.dart';
import 'package:mtest_app/theme/colors/support_colors.dart';
import 'package:mtest_app/theme/text_styles/text_styles.dart';
import 'package:mtest_app/utils/constants.dart';
import 'package:mtest_app/utils/dimensions.dart';

class OtpPage extends GetView<AuthController> with CommonWidgets {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title and description section
                  // _titleDesc(),
                  titleDesc(
                    'Confirm your phone',
                    'We send 6 digits to +976 ${controller.phoneNumber.value}',
                  ),
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
              style: TextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w400,
                color: SupportColors.blue,
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
            onPressed: controller.isOtpComplete
                ? () {
                    Get.toNamed(RouteNames.accountInfo);
                  }
                : null,
            child: Text(
              'Verify Your Number',
              style: TextStyles.titleMedium.copyWith(
                color: controller.isOtpComplete ? Colors.white : Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}
