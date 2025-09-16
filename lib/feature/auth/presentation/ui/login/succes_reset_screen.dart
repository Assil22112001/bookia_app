import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/widgets/custom_bottom.dart';
import 'package:bookia_app/feature/auth/presentation/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccesResetScreen extends StatelessWidget {
  const SuccesResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/Successmark.svg",
              width: 150,
              height: 150,
            ),
            SizedBox(height: 35),
            Text(
              "Password Changed!",
              style: TextStyle(fontSize: 26, color: AppColors.darkcolor),
            ),
            SizedBox(height: 3),
            Text(
              "Your password has been changed\n                  successfully.",
              style: TextStyle(fontSize: 15, color: AppColors.graycolor),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 331,
              height: 60,
              child: CustomBottom(
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                title: "Back to Login",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
