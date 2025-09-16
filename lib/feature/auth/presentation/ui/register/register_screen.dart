import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/widgets/custom_app_bar.dart';
import 'package:bookia_app/core/widgets/custom_bottom.dart';
import 'package:bookia_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              Text(
                "Hello! Register to get\nstarted",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 32),
              CustomTextFormField(hintText: "Username"),
              SizedBox(height: 15),
              CustomTextFormField(hintText: "Email"),
              SizedBox(height: 15),
              CustomTextFormField(hintText: "Password"),
              SizedBox(height: 15),
              CustomTextFormField(hintText: "Confirm Password"),
              SizedBox(height: 30),
              CustomBottom(title: "register"),

              SizedBox(height: 270),

              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.darkcolor,
                        ),
                      ),
                      TextSpan(
                        text: " Login Now",
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
