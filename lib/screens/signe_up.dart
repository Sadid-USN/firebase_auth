import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/signe_up_filds.dart';

class SigneUp extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SigneUp({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<SigneUp> createState() => _SigneUpState();
}

class _SigneUpState extends State<SigneUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Firebase tutorial')),
      backgroundColor: Colors.grey[300],

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.apple_sharp,
                size: 150,
                color: Colors.blueGrey[800],
              ),
              Text(
                'Signe up page',
                style: GoogleFonts.ptSerif(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 33, 44, 58)),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'We Are always glad to see you!',
                style: TextStyle(
                  color: Colors.blueGrey[800],
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              //TODO SIGNE UO FILDS
              const SigneUpFilds(),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Forgot you\'re password?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: const Text(
                      ' Sign in',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
