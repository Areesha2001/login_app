import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../view/dashboard_screen.dart';
import '../view/login_screen.dart';


class LoginController extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool success = false;
  String userEmail = "";
  void signInWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString()
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }



  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
