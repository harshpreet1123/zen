import 'package:flutter/material.dart';
import 'package:zen/screens/auth/auth_screen.dart';
import 'package:zen/screens/auth/login_screen.dart';
import 'package:zen/screens/auth/signup_screen.dart';
import 'package:zen/screens/bottom_navigation.dart';
import 'package:zen/screens/home_screen.dart';
import 'package:zen/screens/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hormony',
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
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
        "/bottom-nav": (context) => const BottomNavigation(),
        "/profile": (context) => const ProfileScreen()
      },
    );
  }
}
