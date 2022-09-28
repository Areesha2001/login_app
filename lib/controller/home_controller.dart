import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomeScreenController extends ChangeNotifier {


void signOutUser() async{
  await FirebaseAuth.instance.signOut();
}
}
