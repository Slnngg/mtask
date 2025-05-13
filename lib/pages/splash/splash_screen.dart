import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mtest_app/components/custom_button.dart';
import 'package:mtest_app/pages/splash/controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Image section
            _image(),

            /// Image container (row)
            _animatedRow(),

            /// Title section
            _title(),

            /// Elevated button
            _button(),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    return Expanded(
      child: PageView.builder(
        controller: controller.pageController,
        onPageChanged: controller.setPage,
        itemCount: controller.splashImages.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 181,
            width: 260,
            child: Center(
              child: SvgPicture.asset(
                controller.splashImages[index],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _animatedRow() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          controller.splashImages.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 8,
            width: controller.currentPage.value != index ? 37 : 16,
            decoration: BoxDecoration(
              color: controller.currentPage.value == index
                  ? Colors.blue
                  : const Color(0xFFD0D0D0),
              borderRadius: BorderRadius.circular(19),
            ),
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(top: 32, bottom: 72),
        child: Text(
          controller.splashTitles[controller.currentPage.value],
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _button() {
    return CustomButton(
      title: 'Next',
      onTap: () {
        if (controller.currentPage.value < 2) {
          controller.pageController.animateToPage(
            controller.currentPage.value + 1,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
          );
        } else {
          debugPrint('last');
        }
      },
      isEnabled: true,
    );
  }
}
