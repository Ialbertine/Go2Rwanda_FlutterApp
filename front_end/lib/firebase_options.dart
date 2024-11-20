// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDmkJcMcwRzphV5_FYBxqhqVv4rnjCCLCA',
    appId: '1:2175104588:web:d0aab3fcb5e6cec91266e9',
    messagingSenderId: '2175104588',
    projectId: 'gotorwanda-3b144',
    authDomain: 'gotorwanda-3b144.firebaseapp.com',
    storageBucket: 'gotorwanda-3b144.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDURUatO3UsmQKRwkTiEzp1W2NcMq1G4PI',
    appId: '1:2175104588:android:542ed9a79872e4471266e9',
    messagingSenderId: '2175104588',
    projectId: 'gotorwanda-3b144',
    storageBucket: 'gotorwanda-3b144.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpXi4SdDb3oJCOIwQ-VIh-83SctC9roGw',
    appId: '1:2175104588:ios:e54a88277c0bc9d41266e9',
    messagingSenderId: '2175104588',
    projectId: 'gotorwanda-3b144',
    storageBucket: 'gotorwanda-3b144.firebasestorage.app',
    iosBundleId: 'com.example.frontEnd',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpXi4SdDb3oJCOIwQ-VIh-83SctC9roGw',
    appId: '1:2175104588:ios:e54a88277c0bc9d41266e9',
    messagingSenderId: '2175104588',
    projectId: 'gotorwanda-3b144',
    storageBucket: 'gotorwanda-3b144.firebasestorage.app',
    iosBundleId: 'com.example.frontEnd',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDmkJcMcwRzphV5_FYBxqhqVv4rnjCCLCA',
    appId: '1:2175104588:web:82512cf165f0b56c1266e9',
    messagingSenderId: '2175104588',
    projectId: 'gotorwanda-3b144',
    authDomain: 'gotorwanda-3b144.firebaseapp.com',
    storageBucket: 'gotorwanda-3b144.firebasestorage.app',
  );
}