import 'package:assignment/controller/view_controllers/signup_view_controller.dart';
import 'package:assignment/themes/theme.dart';
import 'package:assignment/views/login_view/login_view.dart';
import 'package:assignment/widgets/custom_elevation.dart';
import 'package:assignment/widgets/white_space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SignupView extends StatelessWidget {
  SignupView({Key? key}) : super(key: key);

  final controller = Get.put(SignupViewController());
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Get.back(),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create Account.",
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Signup with your phone number.",
                    style: GoogleFonts.poppins(
                      color: AppTheme.lightFontColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const HeightWhiteSpace(3),
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset("assets/svg/signup-doodle.svg"),
                  ),
                  const HeightWhiteSpace(5),
                  _textField(
                      controller: fullNameController, hinttext: "Full Name"),
                  const HeightWhiteSpace(1.5),
                  _textField(controller: emailController, hinttext: "E-mail"),
                  const HeightWhiteSpace(1.5),
                  _textField(
                    hinttext: "Phone",
                    controller: phoneController,
                    numberType: TextInputType.number,
                  ),
                  const HeightWhiteSpace(1.5),
                  _textField(
                    hinttext: "Password",
                    controller: passwordController,
                    obsecureText: true,
                  ),
                  const HeightWhiteSpace(3),
                  GetBuilder<SignupViewController>(
                    builder: (controller) => Align(
                      alignment: Alignment.center,
                      child: CustomElevation(
                        height: 41,
                        child: ElevatedButton(
                          onPressed: () async {
                            final isValid = await controller.validate(
                              fullName: fullNameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                            );
                            if (isValid) {
                              controller.createNewUser(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              AppTheme.buttonColor,
                            ),
                          ),
                          child: controller.isLoading
                              ? Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: _loadingWidget(),
                                )
                              : Text(
                                  'Create',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                  const HeightWhiteSpace(2),
                  InkWell(
                    onTap: () => Get.to(LoginView()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?  ",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppTheme.lightFontColor,
                          ),
                        ),
                        Text(
                          "Sign In",
                          style: GoogleFonts.poppins(
                            color: AppTheme.buttonColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

// Loading indicator custom widget
  LoadingIndicator _loadingWidget() => const LoadingIndicator(
        indicatorType: Indicator.circleStrokeSpin,
        colors: [Colors.white],
        strokeWidth: 2,
        backgroundColor: AppTheme.buttonColor,
        pathBackgroundColor: AppTheme.buttonColor,
      );

// Custom TextField Widget
  TextField _textField({
    required String hinttext,
    required TextEditingController controller,
    bool? obsecureText,
    TextInputType? numberType,
  }) =>
      TextField(
        keyboardType: numberType ?? TextInputType.text,
        obscureText: obsecureText ?? false,
        controller: controller,
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
          hintText: hinttext,
          hintStyle: GoogleFonts.poppins(
            color: AppTheme.lightFontColor,
          ),
          filled: true,
        ),
      );
}
