import 'package:flutter/material.dart';
import 'package:login_app/controller/login_controller.dart';
import 'package:login_app/model/services/auth_services.dart';
import 'package:login_app/view/signup_screen.dart';
import 'package:provider/provider.dart';

import '../model/widgets/text_button_widget.dart';
import '../model/widgets/text_fields_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static LoginController loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthServices>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: height / 6,
            ),
            TextFieldWidget(
              controller: loginController.emailController,
              hintText: 'Enter Your Email',
            ),
            SizedBox(
              height: height / 100,
            ),
            TextFieldWidget(
              hintText: 'Enter Your Password',
              controller: loginController.passwordController,
            ),
            SizedBox(
              height: height / 15,
            ),
            Container(
                padding: const EdgeInsets.only(right: 30, left: 30),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                    onPressed: () async {
                      await authServices.signInWithEmailAndPassword(
                          loginController.emailController.text,
                          loginController.passwordController.text);
                    },
                    child: const Text(
                      'LogIn ',
                      style: TextStyle(color: Colors.white),
                    ))),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Text("Sign Up")),
          ],
        ),
      ),
    );
  }
}
