import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_api_app/screens/home_screen.dart';
import 'package:flutter_weather_api_app/screens/login_screen.dart';

class BoostrapApp extends StatelessWidget {
  BoostrapApp({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = _auth.currentUser;
            if (user == null) {
              return const LoginScreen();
            } else {
              return const HomeScreen();
            }
          }
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        });
  }
}