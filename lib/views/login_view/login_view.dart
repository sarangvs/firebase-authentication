import 'package:assignment/controller/view_controllers/login_view_controller.dart';
import 'package:assignment/themes/theme.dart';
import 'package:assignment/widgets/custom_elevation.dart';
import 'package:assignment/widgets/white_space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final controller = Get.put(LoginViewController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login to Account.",
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Login with your E-mail & Password.",
                style: GoogleFonts.poppins(
                  color: AppTheme.lightFontColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const HeightWhiteSpace(3),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset("assets/svg/login-doodle.svg"),
              ),
              const HeightWhiteSpace(5),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 13.0,
                    horizontal: 8,
                  ),
                  fillColor: AppTheme.formFieldColor,
                  hintText: 'E-mail',
                  hintStyle: GoogleFonts.poppins(
                    color: AppTheme.lightFontColor,
                  ),
                  filled: true,
                ),
              ),
              const HeightWhiteSpace(1.5),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 13.0,
                    horizontal: 8,
                  ),
                  fillColor: AppTheme.formFieldColor,
                  hintText: 'Password',
                  hintStyle: GoogleFonts.poppins(
                    color: AppTheme.lightFontColor,
                  ),
                  filled: true,
                ),
              ),
              const HeightWhiteSpace(3),
              Align(
                alignment: Alignment.center,
                child: CustomElevation(
                  height: 41,
                  child: ElevatedButton(
                    onPressed: () async {
                      final isValid = await controller.validate(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      if (isValid) {
                        controller.loginUser(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppTheme.buttonColor),
                    ),
                    child: Text(
                      'Log In',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const HeightWhiteSpace(5),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Or log in with:",
                  style: GoogleFonts.poppins(
                    color: AppTheme.lightFontColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const HeightWhiteSpace(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey)],
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/svg/google-logo.svg"),
                    ),
                  ),
                  const WidthWhiteSpace(4),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey)],
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/svg/facebook-logo.svg"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
