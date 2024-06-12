import 'package:flutter/material.dart';
import 'package:zen/styles/colors.dart';

class HomeScreen extends StatefulWidget {
  final ScrollController? scrollController;
  const HomeScreen({super.key, this.scrollController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: widget.scrollController,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, Frieren',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Kolors.altColor),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(184, 185, 186, 0.298),
                              offset: Offset(0, 1),
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                            ),
                            BoxShadow(
                              color: Color.fromRGBO(120, 121, 122, 0.149),
                              offset: Offset(0, 1),
                              blurRadius: 3.0,
                              spreadRadius: 1.0,
                            ),
                          ]),
                      padding: const EdgeInsets.all(2),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://img.freepik.com/free-psd/3d-illustration-with-online-avatar_23-2151303097.jpg?w=740&t=st=1718191488~exp=1718192088~hmac=ac8bbd17061e16bf411245fa961eebe13835896a64289e396ae394b44c50b53a',
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
