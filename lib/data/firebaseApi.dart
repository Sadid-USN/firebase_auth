import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class FirebaseApi { 

  // TODO SIGN IN
  Future signeIn(String email, String password, BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: HeartbeatProgressIndicator(
              child: const Text(
                'Loading...',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          );
        });

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    Navigator.pop(context);
  }

  // TODO create user
  Future signeUp(
    String email,
    String password,
    String confirmPasword,
  ) async {
    if (passwordConfirm(password, confirmPasword)) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      // add user details
      // addUserDetails(firstName.trim(), lastName.trim(),);
    }
  }

  Future addUserDetails(
    String firstName,
    String lastName,
    int age,
  ) async {
    await FirebaseFirestore.instance
        .collection('users')
        .add({"name": firstName, "last": lastName, "age": age});
  }

  bool passwordConfirm(
    String password,
    String confirmPassword,
  ) {
    if (password.trim() == confirmPassword.trim()) {
      return true;
    } else {
      return false;
    }
  }
}
