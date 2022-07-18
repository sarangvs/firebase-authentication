import 'package:assignment/controller/authentification_controller.dart';
import 'package:assignment/utils/utils.dart';
import 'package:get/get.dart';

class LoginViewController extends GetxController {
  final authentificationController = Get.find<AuthentificationController>();

  bool _isLoading = false;

//Getter and setter for loading indicater
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

// function for login user
  Future<void> loginUser(
      {required String email, required String password}) async {
    isLoading = true;
    await authentificationController.loginUser(
      email: email,
      password: password,
    );
    isLoading = false;
  }

//Login using google signin
  Future<void> signInwithgoogle() async {
    await authentificationController.signInWithGoogle();
  }

// validate fields in login view
  Future<bool> validate({
    required String email,
    required String password,
  }) async {
    final emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email.trim().isEmpty) {
      Utils.showSnackBar("Email is required");
      return false;
    } else if (!emailValid.hasMatch(email)) {
      Utils.showSnackBar("Please enter a valid email");
      return false;
    }
    if (password.isEmpty) {
      Utils.showSnackBar('Password is required');
      return false;
    }
    return true;
  }
}
