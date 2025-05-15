import 'package:flutter/material.dart';
import 'package:mtest_app/theme/colors/support_colors.dart';
import 'package:mtest_app/theme/text_styles/text_styles.dart';
import 'package:mtest_app/utils/dimensions.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String hintText;
  final bool? isSend;

  const SearchTextField({
    super.key,
    this.controller,
    this.onChanged,
    required this.hintText,
    this.isSend = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: (isSend == true && isSend != null)
            ? const Color.fromARGB(255, 238, 237, 237)
            : const Color.fromARGB(255, 133, 144, 237),
        borderRadius: Dimensions.borderRadius50,
      ),
      child: TextField(
        controller: controller,
        maxLength: 8,
        obscureText: false,
        keyboardType: TextInputType.text,
        style: const TextStyle(fontSize: 14),
        onChanged: onChanged,
        decoration: InputDecoration(
          isCollapsed: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          border: InputBorder.none,
          counterText: '',
          hintText: hintText,
          hintStyle: TextStyles.headlineSmall.copyWith(
            fontWeight: FontWeight.w400,
            color: (isSend == true && isSend != null)
                ? const Color.fromARGB(255, 196, 195, 195)
                : Colors.white,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: (isSend == true && isSend != null)
                ? const Color.fromARGB(255, 196, 195, 195)
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
