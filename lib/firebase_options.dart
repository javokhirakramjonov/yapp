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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPKbQl-iAGVtHoDa1gqGGOboAu1kBG6A4',
    appId: '1:667221937608:android:8ee4f7fae68baf787884fd',
    messagingSenderId: '667221937608',
    projectId: 'yapp-1aef6',
    storageBucket: 'yapp-1aef6.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDU4m1usne0kG_IPohmAaRWnoT9ccQVrqQ',
    appId: '1:667221937608:ios:a1cced7896f30f567884fd',
    messagingSenderId: '667221937608',
    projectId: 'yapp-1aef6',
    storageBucket: 'yapp-1aef6.firebasestorage.app',
    androidClientId: '667221937608-ljvuqla09qkjasb4meun7bg8dntocpk6.apps.googleusercontent.com',
    iosClientId: '667221937608-04iq3n1co24ovr6j4g7800csmtl3kp7t.apps.googleusercontent.com',
    iosBundleId: 'com.example.yapp',
  );

}