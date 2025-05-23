import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtest_app/components/custom_widgets.dart';
import 'package:mtest_app/components/phone_pass_text_field.dart';
import 'package:mtest_app/pages/auth/controller/auth_controller.dart';
import 'package:mtest_app/routes/route_names.dart';
import 'package:mtest_app/theme/colors/support_colors.dart';
import 'package:mtest_app/theme/text_styles/text_styles.dart';
import 'package:mtest_app/utils/constants.dart';
import 'package:mtest_app/utils/dimensions.dart';

class CreateAccountPage extends GetView<AuthController> with CommonWidgets {
  const CreateAccountPage({super.key});

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
                  titleDesc(
                    'Create an account',
                    'Enter your mobile phone number to verify your account',
                  ),
                  verSpace(18),

                  /// Phone number section
                  _phoneNumber(),
                  verSpace(12),

                  /// Password section
                  _password(),
                ],
              ),
            ),

            /// Sign up button
            _button(context),
          ],
        ),
      ),
    );
  }

  Widget _phoneNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone',
          style: TextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        verSpace(6),
        Row(
          children: [
            Container(
              height: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey[400]!,
                  width: 1,
                ),
                borderRadius: Dimensions.borderRadius12,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/mn.png',
                    ),
                    horSpace(4),
                    const Text('+976'),
                  ],
                ),
              ),
            ),
            horSpace(10),
            Expanded(
              child: PhonePassTextField(
                prefixIcon: const SizedBox(),
                textInputType: TextInputType.phone,
                hintText: 'Mobile number',
                isPassword: false,
                
                onChanged: (value) {
                  controller.phoneNumber.value = value;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _password() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        verSpace(6),
        PhonePassTextField(
          prefixIcon:
              Icon(Icons.lock_outline, size: 20, color: Colors.grey[500]),
          hintText: '********',
          textInputType: TextInputType.text,
          isPassword: true,
          onChanged: (value) {
            controller.password.value = value;
          },
        ),
      ],
    );
  }

  Widget _button(BuildContext context) {
    return Obx(
      () => SizedBox(
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
          onPressed: (controller.isFormComplete &&
                  controller.phoneNumber.value.length >= 8)
              ? () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: const EdgeInsets.only(
                            bottom: 18, right: 18, left: 18, top: 14),
                        backgroundColor: Colors.white,
                        surfaceTintColor: Colors.white,
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  iconSize: 24,
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(Icons.close),
                                ),
                              ],
                            ),
                            Image.asset(
                              'assets/images/success.png',
                              height: 200,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                            verSpace(10),
                            Text(
                              'Verify your phone number before we send code',
                              style: TextStyles.headlineMedium.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            verSpace(6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Is this correct? ',
                                  style: TextStyles.headlineSmall.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[700],
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  ' +${controller.phoneNumber.value}',
                                  style: TextStyles.headlineSmall.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[700],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            verSpace(24),
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
                                  Get.toNamed(RouteNames.otpPage);
                                },
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            verSpace(8),
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
                                  Get.back();
                                },
                                child: const Text(
                                  'No',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: SupportColors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              : null,
          child: const Text(
            'Sign up',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
