import 'package:flutter/material.dart';
import 'package:login_app/view/dashboard_screen.dart';
import 'package:login_app/view/login_screen.dart';
import 'package:provider/provider.dart';
import '../controller/signup_controller.dart';
import '../model/services/auth_services.dart';
import '../model/widgets/text_button_widget.dart';
import '../model/widgets/text_fields_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static SignUpController signUpController = SignUpController();
  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthServices>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign Up",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFieldWidget(
              controller: signUpController.emailController,
              hintText: 'Enter Your Email',
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
            child: TextFieldWidget(
              hintText: 'Enter Your Password',
              controller: signUpController.passwordController,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsets.only(right: 30, left: 30),
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                  onPressed: () async {
                    await authServices.createUserWithEmailAndPassword(
                        signUpController.emailController.text,
                        signUpController.passwordController.text);

                   Navigator.pop(context);
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),),),

          const SizedBox(
            height: 10,
          ),
          Container(
              padding: const EdgeInsets.only(right: 30, left: 30),
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                  onPressed: () async {
                    await authServices.signInWithGoogle();
                  },
                  child: Text(
                    "Log In with Google",
                    style: TextStyle(color: Colors.white),
                  ))),
          const SizedBox(
            height: 10,
          ),
          TextButtonWidget(
            buttonText: 'Login with Mobile ',
            onPress: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          TextButtonWidget(
            buttonText: 'Login with Facebook ',
            onPress: () {},
          ),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text("LogIn")),
        ],
      ),
    );
  }
}
