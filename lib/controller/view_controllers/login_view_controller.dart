import 'package:assignment/controller/authentification_controller.dart';
import 'package:assignment/utils/utils.dart';
import 'package:get/get.dart';

class LoginViewController extends GetxController {
  final authentificationController = Get.find<AuthentificationController>();

  void loginUser({required String email, required String password}) async {
    await authentificationController.loginUser(
        email: email, password: password);
  }

  Future<bool> validate({
    required String email,
    required String password,
  }) async {
    final emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (email.trim().isEmpty) {
      Utils.showSnackBar("Email is required");
    } else if (emailValid.hasMatch(email)) {
      Utils.showSnackBar("Please enter a valid email");
    }
    if (password.isEmpty) {
      Utils.showSnackBar('Password is required');
      return false;
    }

    return true;
  }
}
