import 'dart:developer';
import 'package:assignment/models/user_model.dart';
import 'package:assignment/services/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
// instance for getting current user details from firebase
  final user = FirebaseAuth.instance.currentUser;

  UserModel? _userModel;

// getter and setter for saving user data from server
  UserModel? get userModel => _userModel;
  set userModel(UserModel? value) {
    _userModel = value;
    update();
  }

// init function
  @override
  void onInit() {
    super.onInit();
    // getting user details once this controller is put
    getUserDetails(uid: user?.uid ?? "");
  }

// signing out user from the app
  void signOut() async {
    await AuthenticationServices.signOutUser();
  }

// get user details
  Future<void> getUserDetails({required String uid}) async {
    final user = FirebaseFirestore.instance.collection('users');
    // getting user data and saving to model
    final userDetails = await user.where('id', isEqualTo: uid).get();
    userModel = UserModel.fromMap(
      Map<String, String>.from(
        userDetails.docs.first.data(),
      ),
    );
    log("usermodel ${userModel!.toMap()}");
    log("name ${userModel!.name}");
  }
}
