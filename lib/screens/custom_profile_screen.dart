
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_coach_app/router/routes.dart';

final kAuthProviders = [EmailAuthProvider()];

class CustomProfileScreen extends StatelessWidget {
  const CustomProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      appBar: AppBar(title: const Text('Profile')),
      providers: kAuthProviders,
      actions: [
        SignedOutAction((context) {
          context.goNamed(Routes.signIn.name);
        }),
      ],
    );
  }
}