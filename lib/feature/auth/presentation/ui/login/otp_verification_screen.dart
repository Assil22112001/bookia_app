import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/widgets/custom_app_bar.dart';
import 'package:bookia_app/core/widgets/custom_bottom.dart';
import 'package:bookia_app/feature/auth/presentation/ui/login/create_new_password_screen.dart';
import 'package:flutter/material.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

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
              Text("OTP Verification", style: TextStyle(fontSize: 30)),
              SizedBox(height: 10),
              Text(
                "Enter the verification code we just sent on\nyour email address.",
                style: TextStyle(color: AppColors.graycolor, fontSize: 14),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        counterText: "",
                        filled: true,
                        fillColor: AppColors.lightgraycolor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.graycolor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primarycolor),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  );
                }),
              ),

              SizedBox(height: 38),

              CustomBottom(
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateNewPasswordScreen(),
                    ),
                  );
                },
                title: "Verify",
              ),
              SizedBox(height: 470),

              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Didn’t received code?",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.darkcolor,
                        ),
                      ),
                      TextSpan(
                        text: " Resend",
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
