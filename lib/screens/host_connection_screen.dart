import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sport_coach_app/providers/socket_provider.dart';
import 'package:sport_coach_app/router/routes.dart';

class HostConnectionScreen extends StatelessWidget {
  const HostConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final socketProvider = context.read<SocketProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Server'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            socketProvider.initServerSocket();
            context.goNamed(Routes.matchDetails.name);
          },
          child: const Text('Start Hosting'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(Routes.profile.name);
        },
        child: const Icon(Icons.account_circle),
      ),
    );
  }
}
