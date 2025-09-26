import 'package:bookia_app/core/theme/app_colors.dart';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false, this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: AppColors.primarycolor,
      obscureText: widget.isPassword && obscureText,
      decoration: InputDecoration(
        fillColor: AppColors.lightgraycolor,
        filled: true,
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText
                      ? Icons.visibility_off_sharp
                      : Icons.visibility_sharp,
                ),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.graycolor, fontSize: 15),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.bordercolor),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primarycolor),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );


  }
}
