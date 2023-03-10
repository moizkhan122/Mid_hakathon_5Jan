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
    apiKey: 'AIzaSyAhk9TZ_-Zr-e-fRHn39WR11r8z25kcTes',
    appId: '1:351215490903:web:8a8f81e96891f152249012',
    messagingSenderId: '351215490903',
    projectId: 'hakathon5jan',
    authDomain: 'hakathon5jan.firebaseapp.com',
    storageBucket: 'hakathon5jan.appspot.com',
    measurementId: 'G-9NSNJZ6839',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNefA2KCXNM_OZ6NSO3sA9ap2oAFAtdPo',
    appId: '1:351215490903:android:a40d38f56de71910249012',
    messagingSenderId: '351215490903',
    projectId: 'hakathon5jan',
    storageBucket: 'hakathon5jan.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBVA_BC-gh3Dr44ID3fP6A8FI-Ivn0tKM',
    appId: '1:351215490903:ios:b39d3a28ebcebd0c249012',
    messagingSenderId: '351215490903',
    projectId: 'hakathon5jan',
    storageBucket: 'hakathon5jan.appspot.com',
    iosClientId: '351215490903-p19tov4m7ra2fr4edkmpv04p5ctcq6p7.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDBVA_BC-gh3Dr44ID3fP6A8FI-Ivn0tKM',
    appId: '1:351215490903:ios:b39d3a28ebcebd0c249012',
    messagingSenderId: '351215490903',
    projectId: 'hakathon5jan',
    storageBucket: 'hakathon5jan.appspot.com',
    iosClientId: '351215490903-p19tov4m7ra2fr4edkmpv04p5ctcq6p7.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}
