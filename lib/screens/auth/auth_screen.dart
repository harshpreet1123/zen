import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zen/widgets/custom_elevated_button.dart';
import 'package:zen/widgets/custom_text_button.dart';
import 'package:zen/widgets/gap.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset('assets/svg/auth.svg')),
            const HGap(),
            Text(
              'Zen',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const HGap(),
            Text(
              'Stay Productive',
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 16),
            ),
            const HGap(
              height: 40,
            ),
            CustomElevatedButton(
              label: 'Login',
              onPressd: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            const HGap(),
            CustomTextButton(
              label: 'Sign Up',
              onPresed: () {
                Navigator.pushNamed(context, '/signup');
              },
            ),
            const HGap(),
          ],
        ),
      ),
    );
  }
}
