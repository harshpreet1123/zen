import 'package:flutter/material.dart';
import 'package:zen/screens/auth/auth_screen.dart';
import 'package:zen/screens/auth/login_screen.dart';
import 'package:zen/screens/auth/signup_screen.dart';
import 'package:zen/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
        fontFamily: "Nunito",
        primaryColor: const Color(0xff5B67CA),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff5B67CA)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthScreen(),
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}
