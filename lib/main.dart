import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_app/model/services/auth_services.dart';
import 'package:login_app/model/wrapper.dart';
import 'package:login_app/view/login_screen.dart';
import 'package:login_app/view/signup_screen.dart';
import 'package:provider/provider.dart';
import 'controller/signup_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthServices>(create: (_)=> AuthServices(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context)=> Wrapper(),
          '/login': (context)=> LoginScreen(),
        },
      ),
    );
  }
}
