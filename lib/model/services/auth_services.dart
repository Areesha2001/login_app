
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../user_model.dart';

class AuthServices{
  final auth.FirebaseAuth firebaseAuth = auth.FirebaseAuth.instance;
  UserModel? userFromFireBase(auth.User? user){
    if(user == null){
      return null;
    }
    return UserModel(user.uid, user.email);
  }
  Stream<UserModel?>? get user{
    return firebaseAuth.authStateChanges().map(userFromFireBase);
  }

  Future<UserModel?> signInWithEmailAndPassword(String email, String password) async{
    final credential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  return userFromFireBase(credential.user);
  }
  Future<UserModel?> createUserWithEmailAndPassword (String email, String password)async{
final credential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
 return userFromFireBase(credential.user);
  }
  Future<void> signOut() async{
    return await firebaseAuth.signOut();
  }
}