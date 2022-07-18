import 'package:assignment/controller/authentification_controller.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  final authenticationController = Get.find<AuthentificationController>();

  void signOut() async {
    await authenticationController.signOutUser();
  }
}
