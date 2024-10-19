import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_api_app/screens/profile_screen.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    super.key,
    required FirebaseAuth auth,
  }) : _auth = auth;

  final FirebaseAuth _auth;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: InkWell(
          onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ProfileScreen()));
            },
          child: const Icon(
            Icons.verified_user_rounded,
            color: Colors.white,
          ),
        ),
      actions: [
        InkWell(
          onTap: () {
            _auth.signOut();
            
          },
          child: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
