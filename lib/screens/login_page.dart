import 'dart:io';

import 'package:firebase_tutorial/auth/firebaseApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegPage;
  const LoginPage({Key? key, required this.showRegPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailControllor = TextEditingController();
  final _passwordControllor = TextEditingController();

  @override
  void dispose() {
    _emailControllor.dispose();
    _passwordControllor.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0.0,
        // title: const Text('Firebase tutorial'),
        actions: [
          IconButton(
              onPressed: (() {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else if (Platform.isIOS) {
                  exit(0);
                }
              }),
              icon: const Icon(
                Icons.exit_to_app_outlined,
                color: Colors.blueGrey,
                size: 30,
              )),
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.apple_sharp,
                size: 150,
                color: Colors.grey[700],
              ),
              Text(
                'Sign in',
                style: GoogleFonts.ptSerif(
                    fontSize: 38, fontWeight: FontWeight.bold),
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
                height: 50.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: TextField(
                    controller: _emailControllor,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Email'),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: TextField(
                    controller: _passwordControllor,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Password'),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.green[300],
                    borderRadius: BorderRadius.circular(12.0)),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      FirebaseApi().signeIn(
                          _emailControllor.text, _passwordControllor.text);
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ForgotPassword();
                      }));
                    }),
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.showRegPage,
                    child: const Text(
                      ' Sign up',
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
