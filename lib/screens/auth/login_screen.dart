import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zen/widgets/custom_elevated_button.dart';
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
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/email.svg',
                        color: Theme.of(context).primaryColor,
                      ),
                      const Text(' Email')
                    ],
                  ),
                  hintText: 'example@gmail.com',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              hGap(),
              TextFormField(
                decoration: InputDecoration(
                  suffix: InkWell(
                      onTap: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      child: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off)),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  hintText: '●●●●●●●●●',
                  hintStyle: const TextStyle(color: Colors.grey),
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/lock.svg',
                        color: Theme.of(context).primaryColor,
                      ),
                      const Text(' Password')
                    ],
                  ),
                ),
                obscureText: isObscure,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
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
              hGap(),
              Spacer(),
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
                      Navigator.pushNamed(context, '/signup');
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
    );
  }
}
