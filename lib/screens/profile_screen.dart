import 'package:flutter/material.dart';
import 'package:zen/services/auth_services.dart';
import 'package:zen/styles/colors.dart';
import 'package:zen/widgets/gap.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await _authService.signOut();
                print("Logout");
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              hGap(h: 50),
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  'https://img.freepik.com/free-psd/3d-illustration-with-online-avatar_23-2151303097.jpg?w=740&t=st=1718191488~exp=1718192088~hmac=ac8bbd17061e16bf411245fa961eebe13835896a64289e396ae394b44c50b53a',
                  height: 80,
                  width: 80,
                ),
              ),
              hGap(),
              Text(
                'Frieren',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Kolors.altColor),
              ),
              hGap(h: 10),
              Text(
                'frieren1000@gmail.com',
                style: TextStyle(color: Kolors.altColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
