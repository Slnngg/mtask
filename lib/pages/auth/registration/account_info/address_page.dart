import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtest_app/components/custom_widgets.dart';
import 'package:mtest_app/components/phone_pass_text_field.dart';
import 'package:mtest_app/pages/auth/controller/auth_controller.dart';
import 'package:mtest_app/theme/colors/support_colors.dart';
import 'package:mtest_app/theme/text_styles/text_styles.dart';
import 'package:mtest_app/utils/constants.dart';
import 'package:mtest_app/utils/dimensions.dart';

class AddressPage extends GetView<AuthController> with CommonWidgets {
  const AddressPage({super.key});

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
                      'Home Address',
                      'This info needs to be accurate with your ID document',
                    ),
                    verSpace(18),

                    /// Address section
                    _address(),
                    verSpace(12),

                    /// City section
                    _city(),
                    verSpace(12),

                    /// Post code section
                    _postCode(),
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

  Widget _address() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address Line',
          style: TextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        verSpace(6),
        PhonePassTextField(
          prefixIcon:
              Icon(Icons.email_outlined, size: 20, color: Colors.grey[500]),
          hintText: 'Mr.John Doe',
          textInputType: TextInputType.text,
          isEmail: false,
          isPassword: false,
          onChanged: (value) {
            controller.address.value = value;
          },
        ),
      ],
    );
  }

  Widget _city() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'City',
          style: TextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        verSpace(6),
        PhonePassTextField(
          prefixIcon:
              Icon(Icons.email_outlined, size: 20, color: Colors.grey[500]),
          hintText: 'City, State',
          textInputType: TextInputType.text,
          isEmail: false,
          isPassword: false,
          onChanged: (value) {
            controller.city.value = value;
          },
        ),
      ],
    );
  }

  Widget _postCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Post Code',
          style: TextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        verSpace(6),
        PhonePassTextField(
          prefixIcon:
              Icon(Icons.email_outlined, size: 20, color: Colors.grey[500]),
          hintText: 'Ex: 00000',
          textInputType: TextInputType.phone,
          isEmail: false,
          isPassword: false,
          onChanged: (value) {
            controller.postCode.value = value;
          },
        ),
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
            onPressed: (controller.address.value != '' &&
                    controller.city.value != '' &&
                    controller.postCode.value != '')
                ? () {
                    controller.nextPage();
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
}
