import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtest_app/components/phone_pass_text_field.dart';
import 'package:mtest_app/pages/auth/controller/auth_controller.dart';
import 'package:mtest_app/theme/colors/support_colors.dart';
import 'package:mtest_app/theme/text_styles/text_styles.dart';
import 'package:mtest_app/utils/constants.dart';
import 'package:mtest_app/utils/dimensions.dart';

class PersonalInfoPage extends GetView<AuthController> {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
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
                    titleDesc(),
                    verSpace(18),

                    /// Name section
                    _name(),
                    verSpace(12),

                    /// User Name section
                    _userName(),
                    verSpace(12),

                    /// Date of birth section
                    _birthDate(context),
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

  PreferredSizeWidget appBar() {
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

  Widget titleDesc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add your personal info',
          style: TextStyles.headlineMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        verSpace(4),
        Text(
          'This info needs to be accurate with your ID document',
          style: TextStyles.headlineSmall.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _name() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Full Name',
          style: TextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        verSpace(6),
        PhonePassTextField(
          prefixIcon: const SizedBox(),
          hintText: 'Mr.John Doe',
          textInputType: TextInputType.text,
          isEmail: true,
          isPassword: false,
          onChanged: (value) {
            controller.fullName.value = value;
          },
        ),
      ],
    );
  }

  Widget _userName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Username',
          style: TextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        verSpace(6),
        PhonePassTextField(
          prefixIcon: const SizedBox(),
          hintText: '@username',
          textInputType: TextInputType.phone,
          isEmail: true,
          isPassword: false,
          onChanged: (value) {
            controller.userName.value = value;
          },
        ),
      ],
    );
  }

  Widget _birthDate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date of Birth',
          style: TextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        verSpace(6),
        InkWell(
          onTap: () async {
            controller.dateOfBirth.value = await showDatePicker(
              context: context,
              initialDate: DateTime(2000),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    dialogBackgroundColor: Colors.white,
                    colorScheme: const ColorScheme.light(
                      primary: SupportColors.blue,
                      onPrimary: Colors.white,
                      onSurface: Colors.black,
                    ),
                  ),
                  child: child!,
                );
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
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
                Icon(
                  Icons.date_range,
                  color: Colors.grey[400],
                  size: 24,
                ),
                horSpace(6),
                Obx(
                  () => Text(
                    controller.dateOfBirth.value == null
                        ? 'MM/DD/YYYY'
                        : "${controller.dateOfBirth.value?.month.toString().padLeft(2, '0')}/"
                            "${controller.dateOfBirth.value?.day.toString().padLeft(2, '0')}/"
                            "${controller.dateOfBirth.value?.year}",
                    style: TextStyles.titleSmall.copyWith(
                      color: controller.dateOfBirth.value == null
                          ? Colors.grey[400]
                          : Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
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
            onPressed: (controller.fullName.value != '' &&
                    controller.userName.value != '' &&
                    controller.dateOfBirth.value.toString() != '')
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
