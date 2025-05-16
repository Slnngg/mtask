import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtest_app/components/custom_button.dart';
import 'package:mtest_app/routes/route_names.dart';
import 'package:mtest_app/theme/text_styles/text_styles.dart';
import 'package:mtest_app/utils/constants.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verSpace(32),

            /// Image section
            _image(),
            verSpace(64),

            /// Title and description section
            _titleDesc(),
            verSpace(32),

            /// Back to home button
            _button(),
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
    return Image.asset(
      'assets/images/404.png',
    );
  }

  Widget _titleDesc() {
    return Column(
      children: [
        const Text(
          'Error 404',
          textAlign: TextAlign.center,
          style: TextStyles.displaySmall,
        ),
        const Text(
          'Page Not Fount',
          textAlign: TextAlign.center,
          style: TextStyles.displaySmall,
        ),
        verSpace(12),
        Text(
          'Oops! It looks like the page you\'re looking for doesn\'t exist or has been moved. Please try again or go back to the normal page.',
          style: TextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _button() {
    return CustomButton(
      title: 'Back to Home',
      onTap: () {
        Get.toNamed(RouteNames.homePage);
      },
      isEnabled: true,
    );
  }
}
