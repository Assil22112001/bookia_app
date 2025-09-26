
import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/widgets/custom_app_bar.dart';
import 'package:bookia_app/core/widgets/custom_bottom.dart';
import 'package:bookia_app/core/widgets/custom_text_form_field.dart';
import 'package:bookia_app/feature/auth/home/presentation/ui/home_screen.dart';
import 'package:bookia_app/feature/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:bookia_app/feature/auth/presentation/ui/login/forget_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
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
                "Welcome back! Glad\nto see you, Again!",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 32),
              CustomTextFormField(
                controller: emailcontroller,
                hintText: "Enter Your Email",
              ),
              SizedBox(height: 15),
              CustomTextFormField(
                controller: passwordcontroller,
                hintText: "Enter Your Password",
                isPassword: true,
              ),
              SizedBox(height: 13),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPasswordScreen(),
                      ),
                    );
                  },

                  child: Text(
                    "Forgot Password?",

                    style: TextStyle(color: AppColors.darkcolor),
                  ),
                ),
              ),
              SizedBox(height: 30),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is LoginLoadingState) {
                    showDialog(
                      context: context,
                      builder: (context) => CircularProgressIndicator(),
                    );
                  } else if (state is LoginErrorState) {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) =>
                          AlertDialog(content: Text(state.errorMessage)),
                    );
                  } else if (state is LoginSuccessState) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (e) => false,
                    );
                  }
                },
                child: CustomBottom(
                  title: "login",
                  ontap: () {
                    context.read<AuthCubit>().login(
                      email: emailcontroller.text,
                      password: passwordcontroller.text,
                    );
                  },
                ),
              ),
              SizedBox(height: 34),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.darkgraycolor,
                      endIndent: 14,
                    ),
                  ),
                  Text("Or Login with"),
                  Expanded(
                    child: Divider(color: AppColors.darkgraycolor, indent: 14),
                  ),
                ],
              ),
              SizedBox(height: 21),
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.bordercolor),
                      ),
                      child: SvgPicture.asset("assets/icons/facebook_ic.svg"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.bordercolor),
                      ),
                      child: SvgPicture.asset("assets/icons/google_ic.svg"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.bordercolor),
                      ),
                      child: SvgPicture.asset("assets/icons/cib_apple.svg"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 220),

              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Don’t have an account?",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.darkcolor,
                        ),
                      ),
                      TextSpan(
                        text: " Register Now",
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
