// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD01izVUm8AM1qb8fKvDMwRo_1zyudcOkc',
    appId: '1:48032806170:web:57e2350bf401038349a8a3',
    messagingSenderId: '48032806170',
    projectId: 'sport-app-99134',
    authDomain: 'sport-app-99134.firebaseapp.com',
    storageBucket: 'sport-app-99134.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnYfhoyS0xfhY4p9R2cqPTXFGGKyjhvvE',
    appId: '1:48032806170:android:47b4290942d76fb449a8a3',
    messagingSenderId: '48032806170',
    projectId: 'sport-app-99134',
    storageBucket: 'sport-app-99134.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA5_rQv9dWJlxPA3lpazb1_asqvbTNIYzc',
    appId: '1:48032806170:ios:8e58ec03223cb2fd49a8a3',
    messagingSenderId: '48032806170',
    projectId: 'sport-app-99134',
    storageBucket: 'sport-app-99134.appspot.com',
    iosBundleId: 'com.example.sportCoachApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA5_rQv9dWJlxPA3lpazb1_asqvbTNIYzc',
    appId: '1:48032806170:ios:b6b7e24e7df1bcf649a8a3',
    messagingSenderId: '48032806170',
    projectId: 'sport-app-99134',
    storageBucket: 'sport-app-99134.appspot.com',
    iosBundleId: 'com.example.sportCoachApp.RunnerTests',
  );
}
