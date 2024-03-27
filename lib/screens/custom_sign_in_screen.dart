import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_coach_app/router/routes.dart';

final kAuthProviders = [EmailAuthProvider()];

class CustomSignInScreen extends StatelessWidget {
  const CustomSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign in')),
      body: SignInScreen(
        providers: kAuthProviders,
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            context.goNamed(Routes.hostConnection.name);
          }),
          AuthStateChangeAction<UserCreated>((context, state) {
            context.goNamed(Routes.hostConnection.name);
          }),
        ],
      ),
    );
  }
}
