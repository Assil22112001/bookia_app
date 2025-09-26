import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/widgets/custom_app_bar.dart';
import 'package:bookia_app/core/widgets/custom_bottom.dart';
import 'package:bookia_app/core/widgets/custom_text_form_field.dart';
import 'package:bookia_app/feature/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:bookia_app/feature/auth/presentation/ui/login/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _submit() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final pass = _passController.text;
    final confirm = _confirmController.text;

    if (name.isEmpty || email.isEmpty || pass.isEmpty || confirm.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('من فضلك إملأ جميع الحقول')),
      );
      return;
    }
    if (pass.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('كلمة السر يجب ألا تقل عن 6 أحرف')),
      );
      return;
    }
    if (pass != confirm) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تأكيد كلمة السر غير مطابق')),
      );
      return;
    }

    context.read<AuthCubit>().register(
          name: name,
          email: email,
          password: pass,
          confirmPassword: confirm,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: SingleChildScrollView(
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is RegisterLoadingState) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => const Center(child: CircularProgressIndicator()),
                );
              } else if (state is RegisterErrorState) {
                if (Navigator.canPop(context)) Navigator.pop(context); // اقفل اللودينج
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(content: Text(state.errorMessage)),
                );
              } else if (state is RegisterSuccessState) {
                if (Navigator.canPop(context)) Navigator.pop(context); // اقفل اللودينج
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم إنشاء الحساب بنجاح')),
                );

                // ارجع للـ LoginScreen وأغلق كل الروتز
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<AuthCubit>(), // مرّر نفس AuthCubit
                      child: const LoginScreen(),
                    ),
                  ),
                  (route) => false,
                );
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 29),
                const Text(
                  "Hello! Register to get\nstarted",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 32),

                CustomTextFormField(
                  controller: _nameController,
                  hintText: "Username",
                ),
                const SizedBox(height: 15),

                CustomTextFormField(
                  controller: _emailController,
                  hintText: "Email",
                ),
                const SizedBox(height: 15),

                CustomTextFormField(
                  controller: _passController,
                  hintText: "Password",
                  isPassword: true,
                ),
                const SizedBox(height: 15),

                CustomTextFormField(
                  controller: _confirmController,
                  hintText: "Confirm Password",
                  isPassword: true,
                ),
                const SizedBox(height: 30),

                CustomBottom(
                  title: "register",
                  ontap: _submit,
                ),

                const SizedBox(height: 270),

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
                        const WidgetSpan(child: SizedBox(width: 4)),
                        TextSpan(
                          text: "Login Now",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.primarycolor,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // رجوع يدوي لصفحة اللوجين
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                    value: context.read<AuthCubit>(),
                                    child: const LoginScreen(),
                                  ),
                                ),
                                (route) => false,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
