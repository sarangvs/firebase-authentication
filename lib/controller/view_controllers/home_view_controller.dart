import 'dart:developer';
import 'package:assignment/controller/authentification_controller.dart';
import 'package:assignment/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  final authenticationController = Get.put(AuthentificationController());

  final user = FirebaseAuth.instance.currentUser;

  UserModel? _userModel;

  UserModel? get userModel => _userModel;
  set userModel(UserModel? value) {
    _userModel = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getUserDetails(uid: user?.uid ?? "");
  }

  void signOut() async {
    await authenticationController.signOutUser();
  }

  // get user details
  Future<void> getUserDetails({required String uid}) async {
    final user = FirebaseFirestore.instance.collection('users');
    final userDetails = await user.where('id', isEqualTo: uid).get();
    log("eeee ${userDetails.docs.first.data()}");
    userModel = UserModel.fromMap(
      Map<String, String>.from(
        userDetails.docs.first.data(),
      ),
    );
    log("usermodel ${userModel!.toMap()}");
    log("name ${userModel!.name}");
  }
}
