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
    apiKey: 'AIzaSyDdXe5RwFgAhbkOloca7GhsTr4OrM3bpXo',
    appId: '1:370192138430:web:9368ebcd0d9fcdf9449eef',
    messagingSenderId: '370192138430',
    projectId: 'flutter-login-65b19',
    authDomain: 'flutter-login-65b19.firebaseapp.com',
    storageBucket: 'flutter-login-65b19.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCaCM-QR2CvFcA6JfzGJHRffUrSdiPs3M8',
    appId: '1:370192138430:android:2f346d5d78e7124b449eef',
    messagingSenderId: '370192138430',
    projectId: 'flutter-login-65b19',
    storageBucket: 'flutter-login-65b19.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByOd97EivHmVXGY4y5L-1WRJQQfajR09I',
    appId: '1:370192138430:ios:a3ae4120a3714b2b449eef',
    messagingSenderId: '370192138430',
    projectId: 'flutter-login-65b19',
    storageBucket: 'flutter-login-65b19.appspot.com',
    iosBundleId: 'com.example.login',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByOd97EivHmVXGY4y5L-1WRJQQfajR09I',
    appId: '1:370192138430:ios:6bfed9473df8bfb3449eef',
    messagingSenderId: '370192138430',
    projectId: 'flutter-login-65b19',
    storageBucket: 'flutter-login-65b19.appspot.com',
    iosBundleId: 'com.example.login.RunnerTests',
  );
}
