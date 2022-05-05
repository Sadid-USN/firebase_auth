import 'package:firebase_tutorial/auth/firebaseApi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginPage extends StatefulWidget {
  final VoidCallback showRegPage;
  const LoginPage({Key? key,  required this.showRegPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 final  _emailControllor = TextEditingController();
 final  _passwordControllor = TextEditingController();



@override
  void dispose() {
   _emailControllor.dispose();
   _passwordControllor.dispose();

    super.dispose();
  }

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
        
                Icon(Icons.apple_sharp, size: 150, color: Colors.grey[700],),
               const SizedBox(
                height: 70.0,
              ),
              Text(
                'Signe in',
                style: GoogleFonts.ptSerif(
                  fontSize: 38,
                  fontWeight: FontWeight.bold
                ),
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
                child:  Padding(
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
                child:  Padding(
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
                child:  Center(
                  child: GestureDetector(
                    onTap: () {
                      FirebaseApi().signeIn(_emailControllor.text, _passwordControllor.text);
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
                children:  [
                  const Text(
                    'Forgot you\'re password?',
                    style: TextStyle(color: Colors.black,  fontWeight: FontWeight.bold,),
                  ),
                  GestureDetector(
                    onTap: widget.showRegPage,
                    child: const Text(
                      ' Registeretion',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}