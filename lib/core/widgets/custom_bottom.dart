import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final void Function()? ontap;

  const CustomBottom({super.key, required this.title, this.backgroundColor, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor ?? AppColors.primarycolor,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            color: backgroundColor == null ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
