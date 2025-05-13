import 'package:flutter/material.dart';
import 'package:mtest_app/theme/text_styles/text_styles.dart';
import 'package:mtest_app/utils/dimensions.dart';

class PhonePassTextField extends StatefulWidget {
  final bool isPassword;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const PhonePassTextField({
    super.key,
    this.isPassword = false,
    this.controller,
    this.onChanged,
  });

  @override
  State<PhonePassTextField> createState() => _PhonePassTextFieldState();
}

class _PhonePassTextFieldState extends State<PhonePassTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey[400]!,
          width: 1,
        ),
        borderRadius: Dimensions.borderRadius12,
      ),
      child: TextField(
        controller: widget.controller,
        maxLength: 8,
        obscureText: widget.isPassword ? _obscureText : false,
        keyboardType:
            widget.isPassword ? TextInputType.text : TextInputType.phone,
        style: const TextStyle(fontSize: 14),
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          isCollapsed: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          border: InputBorder.none,
          counterText: '',
          hintText: widget.isPassword ? '********' : 'Mobile number',
          hintStyle: TextStyles.headlineSmall.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.grey[400],
          ),
          prefixIcon: widget.isPassword
              ? Icon(Icons.lock_outline, size: 20, color: Colors.grey[500])
              : null,
          suffixIcon: widget.isPassword
              ? IconButton(
                  splashRadius: 20,
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    size: 20,
                    color: Colors.grey[500],
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
