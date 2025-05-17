import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtest_app/components/custom_widgets.dart';
import 'package:mtest_app/pages/auth/controller/auth_controller.dart';
import 'package:mtest_app/routes/route_names.dart';
import 'package:mtest_app/theme/colors/support_colors.dart';
import 'package:mtest_app/theme/text_styles/text_styles.dart';
import 'package:mtest_app/utils/constants.dart';
import 'package:mtest_app/utils/dimensions.dart';

class CountryPage extends GetView<AuthController> with CommonWidgets {
  const CountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(),
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
                    titleDesc(
                      'County of residence',
                      'This info needs to be accurate with your ID document',
                    ),
                    verSpace(18),

                    /// County section
                    _county(context),
                    verSpace(12),
                  ],
                ),
              ),
            ),

            /// Continue button
            _button(context),
          ],
        ),
      ),
    );
  }

  Widget _county(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Post Code'),
        verSpace(6),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Select Country'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _countryOption('Mongolia', 'mn.png'),
                      _countryOption('United States', 'us.png'),
                      _countryOption('Bangladesh', 'bang.png'),
                    ],
                  ),
                );
              },
            );
          },
          child: Container(
            height: 46,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey[400]!,
                width: 1,
              ),
              borderRadius: Dimensions.borderRadius12,
            ),
            child: Row(
              children: [
                Obx(() {
                  return Row(
                    children: [
                      Image.asset(
                        'assets/images/${_countryCode(controller.selectedCountry.value)}.png',
                        width: 24,
                      ),
                      horSpace(10),
                      Text(controller.selectedCountry.value),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _countryOption(String name, String asset) {
    return ListTile(
      leading: Image.asset('assets/images/$asset', width: 24),
      title: Text(name),
      onTap: () {
        controller.selectedCountry.value = name;
        Get.back();
      },
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
            onPressed: controller.selectedCountry.value != ''
                ? () async {
                    controller.saveToDatabase();
                    Get.toNamed(RouteNames.login);
                  }
                : null,
            child: Text(
              'Continue',
              style: TextStyles.titleMedium.copyWith(
                color: controller.isOtpComplete ? Colors.white : Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }

  String _countryCode(String country) {
    switch (country) {
      case 'United States':
        return 'us';
      case 'Bangladesh':
        return 'bd';
      case 'Mongolia':
      default:
        return 'mn';
    }
  }
}
