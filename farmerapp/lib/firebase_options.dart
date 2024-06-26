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
    apiKey: 'AIzaSyBkD6qYuIzPSv4wDBw-C5L5db55j6gbHoI',
    appId: '1:687457787341:web:0abd2ca21200b88048f884',
    messagingSenderId: '687457787341',
    projectId: 'saviru-gov',
    authDomain: 'saviru-gov.firebaseapp.com',
    storageBucket: 'saviru-gov.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRR9Hbu_s8S1qKEdpW85cZu8GGNg0ij3E',
    appId: '1:687457787341:android:b3403b74391613d248f884',
    messagingSenderId: '687457787341',
    projectId: 'saviru-gov',
    storageBucket: 'saviru-gov.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfPyQt1P-tQDytgTOQFkz4-cjet3yBlXI',
    appId: '1:687457787341:ios:f253042a821c33ec48f884',
    messagingSenderId: '687457787341',
    projectId: 'saviru-gov',
    storageBucket: 'saviru-gov.appspot.com',
    iosBundleId: 'com.example.farmerapplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCfPyQt1P-tQDytgTOQFkz4-cjet3yBlXI',
    appId: '1:687457787341:ios:f253042a821c33ec48f884',
    messagingSenderId: '687457787341',
    projectId: 'saviru-gov',
    storageBucket: 'saviru-gov.appspot.com',
    iosBundleId: 'com.example.farmerapplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBkD6qYuIzPSv4wDBw-C5L5db55j6gbHoI',
    appId: '1:687457787341:web:cb1d7f789461cf6248f884',
    messagingSenderId: '687457787341',
    projectId: 'saviru-gov',
    authDomain: 'saviru-gov.firebaseapp.com',
    storageBucket: 'saviru-gov.appspot.com',
  );
}
