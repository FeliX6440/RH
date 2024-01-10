import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDkZRHQEG7nsApgEneNnW7cnxF499PAxo8",
            authDomain: "r-h-test-fdzt8k.firebaseapp.com",
            projectId: "r-h-test-fdzt8k",
            storageBucket: "r-h-test-fdzt8k.appspot.com",
            messagingSenderId: "163732845889",
            appId: "1:163732845889:web:04ffac08f92812886a9dc0"));
  } else {
    await Firebase.initializeApp();
  }
}
