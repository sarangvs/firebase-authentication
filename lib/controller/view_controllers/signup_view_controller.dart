import 'package:assignment/controller/authentification_controller.dart';
import 'package:assignment/utils/utils.dart';
import 'package:get/get.dart';

class SignupViewController extends GetxController {
  final authenticationController = Get.put(AuthentificationController());

  void createNewUser({required String email, required String password}) async {
    await authenticationController.registerNewUser(
      email: email,
      password: password,
    );
  }

  Future<bool> validate({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    final nonAlphabetRegex = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-.,]');
    final emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (fullName.isEmpty) {
      Utils.showSnackBar("Full Name is required");
      return false;
    } else if (nonAlphabetRegex.hasMatch(fullName)) {
      Utils.showSnackBar("Full Name should contains only alphabets");
      return false;
    }
    if (email.isEmpty) {
      Utils.showSnackBar("Email is required");
    } else if (emailValid.hasMatch(email)) {
      Utils.showSnackBar("Please enter a valid email");
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
