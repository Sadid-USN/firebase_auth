import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/auth/auth_page.dart';
import 'package:firebase_tutorial/screens/user_info_page.dart';
import 'package:flutter/material.dart';

class TogglePage extends StatelessWidget {
  const TogglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        
        builder: (context, snapShot){
          if(snapShot.hasData){
            return const UserInfoPage();
          }else{
            return const AuthPage();
          }
        },
        ),
    );
  }
}