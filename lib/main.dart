import 'package:assignment/themes/theme.dart';
import 'package:assignment/utils/utils.dart';
import 'package:assignment/views/home_view/home_view.dart';
import 'package:assignment/views/launch_view/launch_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initializing Firebase
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        scaffoldMessengerKey: Utils.snackbarKey,
        debugShowCheckedModeBanner: false,
        title: 'Assignment',
        theme: themeData,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeView();
            } else {
              return const LaunchView();
            }
          },
        ),
      );
}
