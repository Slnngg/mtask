import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtest_app/routes/route_names.dart';
import 'package:mtest_app/theme/colors/support_colors.dart';
import 'package:mtest_app/theme/text_styles/text_styles.dart';
import 'package:mtest_app/utils/constants.dart';
import 'package:mtest_app/utils/dimensions.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

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
                children: [
                  /// Image secion
                  _image(),
                  verSpace(40),

                  /// Title section
                  _title(),
                  verSpace(12),

                  /// Description section
                  _description(),
                  verSpace(50),

                  /// Sign Up
                  _signUpButton(),
                  verSpace(14),

                  /// Login
                  _loginButton(),
                ],
              ),
            ),
            _privacyPolicy(),
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

  Widget _image() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 36),
      child: Image.asset('assets/images/regis.png'),
    );
  }

  Widget _title() {
    return const Text(
      'Create your \nCoinpay account',
      style: TextStyles.headlineLarge,
      textAlign: TextAlign.center,
    );
  }

  Widget _description() {
    return Text(
      'Coinpay is a powerful tool that allows you to easily send, receive, and track all your transactions.',
      style: TextStyles.bodyMedium.copyWith(
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _signUpButton() {
    return SizedBox(
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
          Get.toNamed(RouteNames.createAccount);
        },
        child: Text(
          'Sign up',
          style: TextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
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
          Get.toNamed(RouteNames.login);
        },
        child: Text(
          'Log in',
          style: TextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: SupportColors.blue,
          ),
        ),
      ),
    );
  }

  Widget _privacyPolicy() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 36),
        child: Center(
          child: Text.rich(
            TextSpan(
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: 1.4,
              ),
              children: [
                TextSpan(
                  text: 'By continuing you accept our \n',
                  style: TextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Terms of Service',
                  style: TextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w400,
                    color: SupportColors.blue,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
                TextSpan(
                  text: ' and ',
                  style: TextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w400,
                    color: SupportColors.blue,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
