import 'package:firebase_tutorial/screens/login_page.dart';
import 'package:firebase_tutorial/screens/signe_up.dart';
import 'package:flutter/cupertino.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({ Key? key }) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // intitially show LoginPage
  bool showLoginPage = true;
  void toggleinPage() {

    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
   if(showLoginPage){
     return  LoginPage(showRegPage: toggleinPage);
   }else{
     return  SigneUp(showLoginPage: toggleinPage);
   }
  }
}