import 'dart:developer';
import 'package:assignment/utils/utils.dart';
import 'package:assignment/views/home_view/home_view.dart';
import 'package:assignment/views/launch_view/launch_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationServices {
  // initalized firebase auth
  static final _auth = FirebaseAuth.instance;

  // initalized google signin
  static final _googleSignIn = GoogleSignIn();

// Function For register new user to firebase
  static Future<void> registerNewUser({
    required String email,
    required String password,
  }) async {
    try {
      // creating new user and navigating view
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        log("Account Creation Success");
        Get.offAll(() => HomeView());
      });
    } on FirebaseAuthException catch (e) {
      // error handling
      Utils.showSnackBar("${e.message}");
      log("$e");
    }
  }

// Function for login existing user
  static Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      // login for existing user and navigating view
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        log("User Login Success ");
        Get.offAll(() => HomeView());
      });
    } on FirebaseAuthException catch (e) {
      // error handling
      Utils.showSnackBar("${e.message}");
      log("Login Error${e.message}");
    }
  }

// Function for signing out user
  static Future<void> signOutUser() async {
    try {
      // signing out from firebase auth
      await _auth.signOut().then((value) {
        log("Sign Out Success");
        Get.offAll(() => const LaunchView());
      });
      // signing out from google auth
      await _googleSignIn.signOut();
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar("${e.message}");
    }
  }

// Function for google signin
  static Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        // getting auth credentials
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        // passing the credentials for google auth and navigating view
        await _auth.signInWithCredential(authCredential).then((value) {
          Get.offAll(() => HomeView());
        });
      }
    } on FirebaseAuthException catch (e) {
      // error handling
      Utils.showSnackBar(e.message ?? "Error");
      log("Google Signin Error ${e.message}");
    }
  }
}
