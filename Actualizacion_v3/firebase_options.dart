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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDX43u_WttbpekN5aTX8PHA-va4ctYKOUE',
    appId: '1:1010811653827:web:e7e65684939dcc73795c76',
    messagingSenderId: '1010811653827',
    projectId: 'project-847068542018181064',
    authDomain: 'project-847068542018181064.firebaseapp.com',
    storageBucket: 'project-847068542018181064.appspot.com',
    measurementId: 'G-95T8GZN130',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQGLLa4mdK-VThY8SI2sHWcq6UazK4fPs',
    appId: '1:1010811653827:android:470125cd1d4cbb4c795c76',
    messagingSenderId: '1010811653827',
    projectId: 'project-847068542018181064',
    storageBucket: 'project-847068542018181064.appspot.com',
  );
}