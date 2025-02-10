import 'package:flutter/material.dart';

import '../../Screens/Login Screen/Login Screen.dart';
import '../../firebase_manager/fierbase_manager.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            FirebaseManager.logout();
            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginScreen.routeName,
              (route) => false,
            );
          },
          child: Text("Logout")),
    );
  }
}
