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
    apiKey: 'AIzaSyBNvKmP9_QFddddiUpP1xqglndz4T8K1wE',
    appId: '1:1081832946971:web:3e3e3d42eb912e54f3e7be',
    messagingSenderId: '1081832946971',
    projectId: 'wieproject-7261b',
    authDomain: 'wieproject-7261b.firebaseapp.com',
    storageBucket: 'wieproject-7261b.firebasestorage.app',
    measurementId: 'G-MQJYJXSW4Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAk1buJbahUb_HNalqLb052NicxeNZGR3w',
    appId: '1:1081832946971:android:d2379e4caf0f7828f3e7be',
    messagingSenderId: '1081832946971',
    projectId: 'wieproject-7261b',
    storageBucket: 'wieproject-7261b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBetW5_N-1RAO654jCQF_ad0e5fL5dfkVY',
    appId: '1:1081832946971:ios:71572913a0646a7af3e7be',
    messagingSenderId: '1081832946971',
    projectId: 'wieproject-7261b',
    storageBucket: 'wieproject-7261b.firebasestorage.app',
    iosBundleId: 'com.example.wie',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBetW5_N-1RAO654jCQF_ad0e5fL5dfkVY',
    appId: '1:1081832946971:ios:54d6cc2a4e80d4e1f3e7be',
    messagingSenderId: '1081832946971',
    projectId: 'wieproject-7261b',
    storageBucket: 'wieproject-7261b.firebasestorage.app',
    iosBundleId: 'com.example.wie.RunnerTests',
  );
}