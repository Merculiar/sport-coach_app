import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_coach_app/firebase_options.dart';
import 'package:sport_coach_app/providers/socket_provider.dart';
import 'package:sport_coach_app/router/app_router.dart';
import 'package:sport_coach_app/services/encrypt_service.dart';
import 'package:sport_coach_app/utils/utils.dart';
import 'package:window_size/window_size.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if (Utils.isDesktop) {
    setWindowTitle('Sport Coach App(Server)');
    setWindowMinSize(const Size(700, 600));
    setWindowMaxSize(Size.infinite);
  }
  EncryptService.initEncryption();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SocketProvider>(
          create: (_) => SocketProvider(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: goRouter,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.indigo),
      ),
    );
  }
}
