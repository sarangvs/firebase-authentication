import 'package:assignment/controller/view_controllers/home_view_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final controller = Get.put(HomeViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Home View",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.defaultDialog(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                title: "Alert!",
                content: const Text("Are you sure, do you want to logout?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("No"),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.signOut();
                    },
                    child: const Text("Yes"),
                  ),
                ],
              );
            },
            child: const Text("Logout"),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Welcome ${FirebaseAuth.instance.currentUser!.displayName ?? ""}",
          style: GoogleFonts.poppins(fontSize: 22),
        ),
      ),
    );
  }
}
