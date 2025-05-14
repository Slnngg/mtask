import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtest_app/components/phone_pass_text_field.dart';
import 'package:mtest_app/pages/auth/controller/auth_controller.dart';
import 'package:mtest_app/theme/colors/support_colors.dart';
import 'package:mtest_app/theme/text_styles/text_styles.dart';
import 'package:mtest_app/utils/constants.dart';
import 'package:mtest_app/utils/dimensions.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

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
                  verSpace(18),

                  /// Phone number section
                  _phoneNumber(),
                  verSpace(12),

                  /// Password section
                  _password(),
                  verSpace(8),

                  Text(
                    'Forgot password?',
                    style: TextStyles.labelLarge.copyWith(
                      color: SupportColors.blue,
                      fontWeight: FontWeight.w400,
                    ),
                  )
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
          'Log in to CoinPay',
          style: TextStyles.headlineMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        verSpace(4),
        Text(
          'Enter your registered mobile number to log ins.',
          style: TextStyles.headlineSmall.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.grey[700],
          ),
        ),
      ],
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
        const Text('Password'),
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
          onPressed: controller.isFormComplete ? () {} : null,
          child: const Text(
            'Log in',
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
