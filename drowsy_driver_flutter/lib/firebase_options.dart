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
    apiKey: 'AIzaSyCeQMeUoaqf6avGWcX2yIEbAE6aiTUDwqk',
    appId: '1:669053528129:web:c872ea123982a25e197ec0',
    messagingSenderId: '669053528129',
    projectId: 'drowsy-driver-d0f37',
    authDomain: 'drowsy-driver-d0f37.firebaseapp.com',
    databaseURL: 'https://drowsy-driver-d0f37-default-rtdb.firebaseio.com',
    storageBucket: 'drowsy-driver-d0f37.appspot.com',
    measurementId: 'G-PJ9BTYH72X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBR1mjC0jc3OCmDt8yAalpYy5TfBzhKq6w',
    appId: '1:669053528129:android:38a4e9e6124b0b6d197ec0',
    messagingSenderId: '669053528129',
    projectId: 'drowsy-driver-d0f37',
    databaseURL: 'https://drowsy-driver-d0f37-default-rtdb.firebaseio.com',
    storageBucket: 'drowsy-driver-d0f37.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDsnQcMrh7l_5ABJ-HI326x_eIdMGULGM',
    appId: '1:669053528129:ios:1a46247338500ae2197ec0',
    messagingSenderId: '669053528129',
    projectId: 'drowsy-driver-d0f37',
    databaseURL: 'https://drowsy-driver-d0f37-default-rtdb.firebaseio.com',
    storageBucket: 'drowsy-driver-d0f37.appspot.com',
    iosClientId: '669053528129-hnj5m2oh0h2k5t5prvocppvalirrg0vr.apps.googleusercontent.com',
    iosBundleId: 'com.autobonics.hydropodHydroponics',
  );
}
