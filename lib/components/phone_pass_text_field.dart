import 'package:flutter/material.dart';
import 'package:mtest_app/theme/text_styles/text_styles.dart';
import 'package:mtest_app/utils/dimensions.dart';

class PhonePassTextField extends StatefulWidget {
  final bool isPassword;
  final bool? isEmail;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String hintText;
  final Widget prefixIcon;
  final TextInputType textInputType;

  const PhonePassTextField({
    super.key,
    this.isPassword = false,
    this.controller,
    this.onChanged,
    this.isEmail = false,
    required this.hintText,
    required this.prefixIcon,
    required this.textInputType,
  });

  @override
  State<PhonePassTextField> createState() => _PhonePassTextFieldState();
}

class _PhonePassTextFieldState extends State<PhonePassTextField> {
  bool _obscureText = true;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  bool _validateEmail(String input) {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegex.hasMatch(input);
  }

  void _handleChange(String value) {
    if (widget.isEmail == true) {
      setState(() {
        _errorText = value.isEmpty || _validateEmail(value)
            ? null
            : 'Please enter a valid email';
      });
    }

    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 46,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: _errorText != null ? Colors.red : Colors.grey[400]!,
              width: 1,
            ),
            borderRadius: Dimensions.borderRadius12,
          ),
          child: TextField(
            controller: widget.controller,
            maxLength: widget.hintText == 'Mobile number'
                ? 8
                : widget.isPassword
                    ? 8
                    : null,
            obscureText: widget.isPassword ? _obscureText : false,
            keyboardType: widget.textInputType,
            style: const TextStyle(fontSize: 14),
            onChanged: _handleChange,
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              border: InputBorder.none,
              counterText: '',
              hintText: widget.hintText,
              hintStyle: TextStyles.headlineSmall.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.grey[400],
              ),
              prefixIcon:
                  widget.prefixIcon is! SizedBox ? widget.prefixIcon : null,
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
        ),
        if (_errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 8),
            child: Text(
              _errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
