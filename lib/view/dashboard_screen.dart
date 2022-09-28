import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/model/services/auth_services.dart';
import 'package:provider/provider.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static HomeScreenController homeScreenController = HomeScreenController();


  @override
  Widget build(BuildContext context) {
   final authService= Provider.of<AuthServices>(context);
    return TextButton(
        onPressed: () async {
await authService.signOut();
          print("sign out");
        },
        child: Text("Sign Out"));
  }
}
