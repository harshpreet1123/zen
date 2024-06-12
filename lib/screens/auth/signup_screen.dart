import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zen/widgets/custom_elevated_button.dart';
import 'package:zen/widgets/custom_text_from_filed.dart';
import 'package:zen/widgets/gap.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
              hGap(h:40),
              Text(
                  'Sign up',
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
                const CustomTextFormField(
                  label: 'Confirm Password',
                  iconPath: 'assets/svg/lock.svg',
                  hintText: '●●●●●●●●●',
                  isPasswordField: true,
                ),
                hGap(h: 50),
                CustomElevatedButton(
                  label: 'Create',
                  onPressd: () {},
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
                hGap(h:50),
                
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
                        Navigator.pushNamed(context, '/login');
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
