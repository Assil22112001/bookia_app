import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/widgets/custom_app_bar.dart';
import 'package:bookia_app/core/widgets/custom_bottom.dart';
import 'package:bookia_app/core/widgets/custom_text_form_field.dart';
import 'package:bookia_app/feature/auth/presentation/ui/login/succes_reset_screen.dart';

import 'package:flutter/material.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

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
              Text("Create new password", style: TextStyle(fontSize: 30)),
              SizedBox(height: 32),

              Text(
                "Your new password must be unique from those\npreviously used.",
                style: TextStyle(color: AppColors.graycolor, fontSize: 14),
              ),
              SizedBox(height: 32),

              CustomTextFormField(hintText: "New Password"),
              SizedBox(height: 15),
              CustomTextFormField(hintText: "Confirm Password"),

              SizedBox(height: 38),
              CustomBottom(
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuccesResetScreen(),
                    ),
                  );
                },
                title: "Reset Password",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
