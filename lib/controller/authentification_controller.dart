import 'dart:developer';

import 'package:assignment/utils/utils.dart';
import 'package:assignment/views/home_view/home_view.dart';
import 'package:assignment/views/launch_view/launch_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthentificationController extends GetxController {
  final _auth = FirebaseAuth.instance;

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

  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        log("User Login Success ");
        Get.offAll(HomeView());
      }).onError((error, stackTrace) {
        Utils.showSnackBar("Something went wrong");
        log("Login Error $error");
      });
    } catch (e) {
      Utils.showSnackBar("Something went wrong");
      log("Login Error$e");
    }
  }

  Future<void> signOutUser() async {
    _auth.signOut().then((value) {
      log("Sign Out Success");
      Get.offAll(const LaunchView());
    });
  }
}
