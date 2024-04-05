import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions getFirebaseOptions(){
    return devConfig;
  }



  static const FirebaseOptions devConfig = FirebaseOptions(
      apiKey: 'AIzaSyDyoevrPiDr3v9_UlzrRMJyZUQWetbhpjE',
      appId: '1:604033658780:android:b6f27037bfc84153792259',
      messagingSenderId: '',
      projectId: 'peace-pulse'

  );


}