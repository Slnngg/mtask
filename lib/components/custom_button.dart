import 'package:flutter/material.dart';
import 'package:mtest_app/theme/colors/support_colors.dart';
import 'package:mtest_app/utils/dimensions.dart';

// Custom Button Component
class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isEnabled;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isEnabled ? SupportColors.blue : Colors.grey,
            shape: const RoundedRectangleBorder(
              borderRadius: Dimensions.borderRadius50,
            ),
            elevation: 0,
          ),
          onPressed: isEnabled ? onTap : null,
          child: Text(
            title,
            style: const TextStyle(
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
