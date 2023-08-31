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
    apiKey: 'AIzaSyA6-s2b-bK43-0kaE_e6lSlMKZMm_XnLUQ',
    appId: '1:799813393315:web:25ac17569bb8c51802d816',
    messagingSenderId: '799813393315',
    projectId: 'ecommerce-5ea59',
    authDomain: 'ecommerce-5ea59.firebaseapp.com',
    storageBucket: 'ecommerce-5ea59.appspot.com',
    measurementId: 'G-3ME3710GDN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAP8Q8Cg0Ze-TrGck9DLr_slJbcvB6N5O4',
    appId: '1:799813393315:android:a5b924ad3366faeb02d816',
    messagingSenderId: '799813393315',
    projectId: 'ecommerce-5ea59',
    storageBucket: 'ecommerce-5ea59.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdAU0avqEVrKRW4xfYgZZ3lKd0groNMJA',
    appId: '1:799813393315:ios:f184dda19ed8b5c602d816',
    messagingSenderId: '799813393315',
    projectId: 'ecommerce-5ea59',
    storageBucket: 'ecommerce-5ea59.appspot.com',
    iosClientId: '799813393315-5d7kfcv29le7lk3d74i8860n06tv8l7h.apps.googleusercontent.com',
    iosBundleId: 'com.example.theStore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBdAU0avqEVrKRW4xfYgZZ3lKd0groNMJA',
    appId: '1:799813393315:ios:d6f93eb9273523aa02d816',
    messagingSenderId: '799813393315',
    projectId: 'ecommerce-5ea59',
    storageBucket: 'ecommerce-5ea59.appspot.com',
    iosClientId: '799813393315-f3dnuok4fs51j79ebnmh0tqj1r19ppar.apps.googleusercontent.com',
    iosBundleId: 'com.example.theStore.RunnerTests',
  );
}