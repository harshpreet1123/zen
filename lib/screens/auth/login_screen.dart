import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zen/widgets/custom_elevated_button.dart';
import 'package:zen/widgets/custom_text_from_filed.dart';
import 'package:zen/widgets/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hGap(h: 40),
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 36,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w700),
                ),
                hGap(),
                const CustomTextFormField(
                    label: 'Email',
                    iconPath: 'assets/svg/email.svg',
                    hintText: 'example@gmail.com'),
                hGap(),
                const CustomTextFormField(
                  label: 'Password',
                  iconPath: 'assets/svg/lock.svg',
                  hintText: '●●●●●●●●●',
                  isPasswordField: true,
                ),
                hGap(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                hGap(h: 50),
                CustomElevatedButton(
                  label: 'Login',
                  onPressd: () {
                    
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/bottom-nav', (route) => false);
                  },
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
                      'Don\'t have an account? ',
                      style: TextStyle(
                          fontSize: 16, color: Theme.of(context).primaryColor),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/signup');
                      },
                      child: Text('Sign Up',
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
        ),
      ),
    );
  }
}
