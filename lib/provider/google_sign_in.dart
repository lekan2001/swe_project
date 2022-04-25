import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async{
   final googleUser = await googleSignIn.signIn();
   if (googleUser == null){
     return Container(
            child: const Center(
              child: Text('Please Sign In')),
          );
   };
   _user = googleUser;

   final googleAuth = await googleUser.authentication;

   final credentials = GoogleAuthProvider.credential(
     accessToken: googleAuth.accessToken,
     idToken: googleAuth.idToken,
   );
   await FirebaseAuth.instance.signInWithCredential(credentials);
   notifyListeners();
  }
  Future <void>googleSignOut() async{
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}