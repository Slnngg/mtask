import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtest_app/components/custom_widgets.dart';
import 'package:mtest_app/pages/send/controller/send_controller.dart';
import 'package:mtest_app/routes/route_names.dart';
import 'package:mtest_app/theme/colors/support_colors.dart';
import 'package:mtest_app/theme/text_styles/text_styles.dart';
import 'package:mtest_app/utils/constants.dart';
import 'package:mtest_app/utils/dimensions.dart';

class SelectPurposePage extends GetView<SendController> with CommonWidgets {
  SelectPurposePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SupportColors.backgroundColor,
      appBar: commonAppBar(isGrey: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title and description section
                titleDesc(
                  'Select a Purpose',
                  'Select a Method for Sending Money',
                ),
                verSpace(18),

                /// Choose method section
                _chooseMethod(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _chooseMethod() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: methodList.length,
      itemBuilder: (context, index) {
        final methods = methodList[index];
        return Obx(
          () => InkWell(
            onTap: () {
              /// Choose method
              controller.selectedMethodIndex.value = index;
              if (controller.selectedMethodIndex.value != -1) {
                Get.toNamed(RouteNames.methodView);
              }
            },
            child: _methodList(
              methods['color'],
              methods['iconImg'],
              methods['title'],
              methods['desc'],
              methods['iconColor'],
              controller.selectedMethodIndex.value == index,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return verSpace(14);
      },
    );
  }

  Widget _methodList(
    Color color,
    String iconImg,
    String title,
    String desc,
    Color iconColor,
    bool isSelected,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: Dimensions.borderRadius12,
        border: isSelected
            ? const Border(
                bottom: BorderSide(
                  color: SupportColors.blue,
                  width: 1,
                ),
              )
            : null,
      ),
      padding: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(10),
              child: ClipOval(
                child: Image.asset(
                  iconImg,
                  height: 24,
                  width: 24,
                  fit: BoxFit.cover,
                  color: iconColor,
                ),
              ),
            ),
            horSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.bodyLarge,
                ),
                Text(
                  desc,
                  style: TextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Image.asset(
              isSelected == true
                  ? 'assets/images/fill_circle.png'
                  : 'assets/images/empty_circle.png',
              height: 24,
              width: 24,
            ),
          ],
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> methodList = [
    {
      'color': Colors.blue.withOpacity(0.2),
      'iconImg': 'assets/images/profile.png',
      'title': 'Personal',
      'desc': 'Pay yout friends and family',
      'iconColor': Colors.blue,
    },
    {
      'color': Colors.yellow.withOpacity(0.2),
      'iconImg': 'assets/images/bag.png',
      'title': 'Business',
      'desc': 'Pay your employee',
      'iconColor': Colors.yellow,
    },
    {
      'color': Colors.orange.withOpacity(0.2),
      'iconImg': 'assets/images/doc.png',
      'title': 'Payment',
      'desc': 'For payment utility bills',
      'iconColor': Colors.orange,
    },
  ];
}
