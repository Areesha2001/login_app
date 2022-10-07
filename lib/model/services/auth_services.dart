
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../user_model.dart';

class AuthServices{
  final auth.FirebaseAuth firebaseAuth = auth.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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


  Future<auth.UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow

    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();


    AuthCredential credential = GoogleAuthProvider.getCredential(

      accessToken: googleSignInAuthentication.accessToken,

      idToken: googleSignInAuthentication.idToken,

    );
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await auth.FirebaseAuth.instance.signInWithCredential(credential);
  }
}