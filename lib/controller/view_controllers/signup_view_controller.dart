import 'package:assignment/services/authentication.dart';
import 'package:assignment/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignupViewController extends GetxController {

  bool _isLoading = false;

//Getter and setter for loading indicater
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

// Function for registering new user
  Future<void> createNewUser(
      {required String email, required String password}) async {
    isLoading = true;
    // passing user details for registering new user
    await AuthenticationServices.registerNewUser(
      email: email,
      password: password,
    );
    isLoading = false;
  }

  // Save user details to db
  Future<void> saveUserdetails({
    required String name,
    required String phone,
    required String email,
  }) async {
    final user = FirebaseFirestore.instance.collection('users');
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final userMap = {
      "id": uid,
      "name": name,
      "phone": phone,
      "email": email,
      "createdAt": DateTime.now().toIso8601String(),
    };
    // passing user details as json to db 
    await user.add(userMap);
  }

  // Validate field in sign up view
  Future<bool> validate({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    final nonAlphabetRegex = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-.,]');
    final emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (fullName.isEmpty) {
      Utils.showSnackBar("Full Name is required");
      return false;
    } else if (nonAlphabetRegex.hasMatch(fullName)) {
      Utils.showSnackBar("Full Name should contains only alphabets");
      return false;
    }
    if (email.isEmpty) {
      Utils.showSnackBar("Email is required");
      return false;
    } else if (!emailValid.hasMatch(email)) {
      Utils.showSnackBar("Please enter a valid email");
      return false;
    }
    if (phone.trim().isEmpty) {
      Utils.showSnackBar('Phone number is required');
      return false;
    } else if (phone.trim().length != 10) {
      Utils.showSnackBar('Enter 10 digit number');
      return false;
    }

    return true;
  }
}
