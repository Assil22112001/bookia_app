import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/widgets/custom_app_bar.dart';
import 'package:bookia_app/core/widgets/custom_bottom.dart';
import 'package:bookia_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 29),
              Text("Forgot Password?", style: TextStyle(fontSize: 30)),
              SizedBox(height: 10),
              Text(
                "Don't worry! It occurs. Please enter the email\naddress linked with your account.",
                style: TextStyle(color: AppColors.graycolor, fontSize: 14),
              ),
              SizedBox(height: 32),
              CustomTextFormField(hintText: "Enter Your Email"),

              SizedBox(height: 38),
              CustomBottom(title: "Send Code"),
              SizedBox(height: 470),

              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Remember Password?",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.darkcolor,
                        ),
                      ),
                      TextSpan(
                        text: "  Login",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.primarycolor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
