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
    apiKey: 'AIzaSyATwYVhP6_7TtWCNzDr5jHbDDqfdPujsRQ',
    appId: '1:590574957132:web:3d6c1528a4afba7a8bbae9',
    messagingSenderId: '590574957132',
    projectId: 'flutter-cubit-firebase-dev',
    authDomain: 'flutter-cubit-firebase-dev.firebaseapp.com',
    storageBucket: 'flutter-cubit-firebase-dev.appspot.com',
    measurementId: 'G-H2C0HCYZ0D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbd6u6JJvFfwUaRgKsYwjW9Qh4m7DIodM',
    appId: '1:590574957132:android:7e525927e54e4d068bbae9',
    messagingSenderId: '590574957132',
    projectId: 'flutter-cubit-firebase-dev',
    storageBucket: 'flutter-cubit-firebase-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-pvE_snOL0rqcanAE6QIZNjAssQAmohs',
    appId: '1:590574957132:ios:dcff9fb76bfcb6f88bbae9',
    messagingSenderId: '590574957132',
    projectId: 'flutter-cubit-firebase-dev',
    storageBucket: 'flutter-cubit-firebase-dev.appspot.com',
    iosClientId: '590574957132-9e0b54cfdfb4fbda8vopnan9tgiiopgi.apps.googleusercontent.com',
    iosBundleId: 'com.fluttercubitfirebase.app.dev',
  );

}