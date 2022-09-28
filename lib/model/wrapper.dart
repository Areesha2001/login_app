import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/model/services/auth_services.dart';
import 'package:login_app/model/user_model.dart';
import 'package:login_app/view/dashboard_screen.dart';
import 'package:login_app/view/login_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthServices>(context);
    return StreamBuilder<UserModel?>(
        stream: authServices.user,
        builder: (_, AsyncSnapshot<UserModel?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final UserModel? user = snapshot.data;
            return user == null ? const LoginScreen() : const HomeScreen();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
