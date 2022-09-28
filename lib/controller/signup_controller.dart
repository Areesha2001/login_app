import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../view/login_screen.dart';


class SignUpController extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool success = false;
  String userEmail = "";

  void register(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailController.value.toString(),
          password: passwordController.value.toString()
      );
      // print(userCredential.)
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
