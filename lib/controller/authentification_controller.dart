import 'dart:developer';

import 'package:assignment/utils/utils.dart';
import 'package:assignment/views/home_view/home_view.dart';
import 'package:assignment/views/launch_view/launch_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthentificationController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

// Function For register new user to firebase
  Future<void> registerNewUser(
      {required String email, required String password}) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        log("Account Creation Success");
        Get.offAll(HomeView());
      });
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar("${e.message}");
      log("$e");
    }
  }

// Function for login existing user
  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        log("User Login Success ");
        Get.offAll(HomeView());
      });
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar("${e.message}");
      log("Login Error${e.message}");
    }
  }

// Function for signing out user
  Future<void> signOutUser() async {
    try {
      await _auth.signOut().then((value) {
        log("Sign Out Success");
        Get.offAll(const LaunchView());
      });
      await _googleSignIn.signOut();
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar("${e.message}");
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await _auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar("${e.message}");
      log("Google Signin Error ${e.message}");
    }
  }
}
