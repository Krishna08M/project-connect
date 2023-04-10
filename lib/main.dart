import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_media/Profile/profile_Screen.dart';
import 'package:social_media/models/User_preferences.dart';
import 'package:social_media/screens/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   scaffoldBackgroundColor: Colors.black,
      //   dialogBackgroundColor: Colors.black,
      //   primarySwatch: Colors.grey,
      //   cardColor: Colors.black,
      //   accentColor: Colors.black,
      // ),
      theme: ThemeData(
        primaryColor: Colors.blueAccent.shade200,
        dividerColor: Colors.black,
      ),
      home: const SigInScreen(),
    );
  }
}
