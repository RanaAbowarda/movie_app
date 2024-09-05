import 'package:flutter/material.dart';
import 'package:movie_app/theme/app_color.dart';

typedef MyValidator = String? Function(String?);

class CustomFormField extends StatelessWidget {
  CustomFormField(
      {super.key,
      required this.hint,
      required this.controller,
      required this.validator,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.prefixIcon});

  TextEditingController controller = TextEditingController();
  String hint;
  MyValidator validator;
  TextInputType keyboardType;
  bool obscureText;
  Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        obscureText: obscureText,
        style: Theme.of(context).textTheme.bodyMedium,
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          fillColor: AppColor.yellowColor.withOpacity(0.12),
          filled: true,
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
          hintText: hint,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColor.yellowColor),
        ),
      ),
    );
  }
}
