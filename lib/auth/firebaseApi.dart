import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseApi {
  Future signeIn(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  // create user
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
    await FirebaseFirestore.instance.collection('users').add({
      "firstName": firstName,
      "lastName": lastName,
      "age": age
   
     
    });
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
