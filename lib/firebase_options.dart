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
    apiKey: 'AIzaSyDRB9E-e7p8dC6QImEmoif2YQ-SJe1vx7o',
    appId: '1:1047959994129:web:56c639a36e8f705348d6b0',
    messagingSenderId: '1047959994129',
    projectId: 'ebookapp-437be',
    authDomain: 'ebookapp-437be.firebaseapp.com',
    storageBucket: 'ebookapp-437be.appspot.com',
    measurementId: 'G-GS4YCPZEKR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUTTEq_3GGlADOdtaM9DG6FZXuDr8NbAU',
    appId: '1:1047959994129:android:4d82507c7e1be94348d6b0',
    messagingSenderId: '1047959994129',
    projectId: 'ebookapp-437be',
    storageBucket: 'ebookapp-437be.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKMwdy-t1LHf6B6bdflwTrTGtn4tvMnBc',
    appId: '1:1047959994129:ios:0f6a3fc53ca6071c48d6b0',
    messagingSenderId: '1047959994129',
    projectId: 'ebookapp-437be',
    storageBucket: 'ebookapp-437be.appspot.com',
    iosBundleId: 'com.example.eBookApp',
  );
}
