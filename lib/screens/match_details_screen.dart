import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sport_coach_app/dialogs/edit_dialog.dart';
import 'package:sport_coach_app/providers/socket_provider.dart';
import 'package:sport_coach_app/router/routes.dart';
import 'package:sport_coach_app/utils/utils.dart';
import 'package:sport_coach_app/widgets/qr_popup.dart';

class MatchDetailsScreen extends StatefulWidget {
  const MatchDetailsScreen({super.key});

  @override
  State<MatchDetailsScreen> createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {
  String ip = '';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ip = await Utils.getIPAddress() ?? '';
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final socketProvider = context.watch<SocketProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Column(
                children: [
                  Text('IP: $ip'),
                  const Text('PORT: 8080'),
                  QRMenuPopup(ipAddress: ip, port: '8080'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Column(
            children: [
              Text(
                'Score: ${socketProvider.matchScore}',
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 8),
              Text(
                'Information: ${socketProvider.information}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
              onPressed: () async {
                  showDialog<void>(
                    context: context,
                    builder: (_) => const EditDialog(),
                  );
                },
                child: const Text('Edit data'),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      socketProvider.sendData();
                    },
                    child: const Text('Send data'),
                  ),
                ],
              ),
            ],
          ),
        ],
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
