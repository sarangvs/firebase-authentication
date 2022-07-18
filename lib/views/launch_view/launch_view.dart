import 'package:assignment/themes/theme.dart';
import 'package:assignment/views/signup_view/signup_view.dart';
import 'package:assignment/widgets/custom_elevation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchView extends StatelessWidget {
  const LaunchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width / 1.4,
                  child: SvgPicture.asset(
                    height: Get.height * .4,
                    'assets/svg/first-screen-doodle.svg',
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height / 8),
            Container(
              padding: const EdgeInsets.only(top: 30),
              decoration: const BoxDecoration(
                color: AppTheme.formFieldColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                    topRight: Radius.circular(200)),
              ),
              height: Get.height / 3.9,
              child: Center(
                child: CustomElevation(
                  height: 41,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to( SignupView());
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppTheme.buttonColor),
                    ),
                    child: Text(
                      'Get Started',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
