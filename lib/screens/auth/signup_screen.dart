import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zen/services/auth_services.dart';
import 'package:zen/styles/colors.dart';
import 'package:zen/widgets/custom_elevated_button.dart';
import 'package:zen/widgets/custom_text_from_filed.dart';
import 'package:zen/widgets/gap.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final AuthService _authService = AuthService();
  bool isLoading = false;
  String _errorMessage = '';
  void _signUp() async {
    setState(() {
      isLoading = true;
    });
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _errorMessage = "Passwords do not match";
      });
      return;
    }

    User? result = await _authService.signUpWithEmailPassword(
      _emailController.text,
      _passwordController.text,
    );
    setState(() {
      isLoading = false;
    });
    if (result != null) {
      // Sign-up successful, navigate to home screen
      Navigator.pushNamedAndRemoveUntil(
          context, '/bottom-nav', (route) => false);
    } else {
      // Sign-up failed, show error message
      setState(() {
        _errorMessage = result.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hGap(h: 40),
              Text(
                'Sign up',
                style: TextStyle(
                    fontSize: 36,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700),
              ),
              hGap(),
              CustomTextFormField(
                  label: 'Email',
                  iconPath: 'assets/svg/email.svg',
                  hintText: 'example@gmail.com',
                  controller: _emailController),
              hGap(),
              CustomTextFormField(
                label: 'Password',
                iconPath: 'assets/svg/lock.svg',
                hintText: '●●●●●●●●●',
                isPasswordField: true,
                controller: _passwordController,
              ),
              hGap(),
              CustomTextFormField(
                label: 'Confirm Password',
                iconPath: 'assets/svg/lock.svg',
                hintText: '●●●●●●●●●',
                isPasswordField: true,
                controller: _confirmPasswordController,
              ),
              hGap(h: 50),
              isLoading
                  ? Center(
                    child: CircularProgressIndicator(
                        color: Kolors.primaryColor,
                      ),
                  )
                  : CustomElevatedButton(
                      label: 'Create',
                      onPressd: _signUp,
                    ),
              hGap(h: 50),
              const Row(
                children: [
                  Flexible(
                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                  ),
                  Text('or with'),
                  Flexible(
                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                  )
                ],
              ),
              hGap(),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {},
                  child: SvgPicture.asset('assets/svg/google.svg'),
                ),
              ),
              hGap(h: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account? ',
                    style: TextStyle(
                        fontSize: 16, color: Theme.of(context).primaryColor),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text('Log in',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w700)),
                  )
                ],
              ),
              hGap(h: 10),
            ],
          ),
        ),
      )),
    );
  }
}
