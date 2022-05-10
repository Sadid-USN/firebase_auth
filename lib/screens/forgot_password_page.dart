import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailControllor = TextEditingController();
  final String _lounchUrlGmail = 'https://mail.google.com/mail/u/0/#inbox';
  Future<void> _launchInBrowser(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url),
     );
  } else {
    throw 'Пайванд кушода нашуд $url';
  }
}

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailControllor.text.trim());
           showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: SizedBox(
                height: 150,
                child: Column(
                  children:  [
                    const Text('📩 ', style: TextStyle(color: Colors.red, fontSize: 50),),
                   
                       
                      GestureDetector(
                        onTap: (() {
                           _launchInBrowser(_lounchUrlGmail);
                      
                        }),
                      child: RichText(text: TextSpan(style: TextStyle(color: Colors.blueGrey[700], fontSize: 18),
                      children: const [
                         TextSpan(text:'Password reset link sent! Check youre '),
                         TextSpan(text:'email', style: TextStyle(color: Colors.blue)),
                      ]
                      
                      ),),
                    ),
                    
                  ],
                ),
              ),
            );
          });
          
    } on FirebaseException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: SizedBox(
                height: 150,
                child: Column(
                  children: [
                    const Text('⚠️ ', style: TextStyle(color: Colors.red, fontSize: 50),),
                    Text('${e.message}', style: const TextStyle(),),
                  ],
                ),
              ),
            );
          });
    }
  }

  @override
  void dispose() {
    _emailControllor.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0.0,
        // title: const Text('Firebase tutorial'),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.mail_outline,
                size: 150,
                color: Colors.pink[400],
              ),
              const SizedBox(
                height: 70.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Enter  Youre Email and we will send you a password reset link',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSerif(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[800]),
                ),
              ),
              const SizedBox(
                height: 10.0,
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
                    onTap: passwordReset,
                    child: const Text(
                      'Send',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
            
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Signe in',
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
