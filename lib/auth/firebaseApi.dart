import 'package:firebase_auth/firebase_auth.dart';

class FirebaseApi {
  Future signeIn(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  Future signeUp(
    String email,
    String password,
    String confirmPasword,
  ) async {
    if (passwordConfirm( password, confirmPasword)) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    }
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
