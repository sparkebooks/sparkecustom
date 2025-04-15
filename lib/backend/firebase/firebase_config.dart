import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBplQy9SDJwOkaRkQ4fszjrbRS4lhlWwus",
            authDomain: "sparke-7lyyy6.firebaseapp.com",
            projectId: "sparke-7lyyy6",
            storageBucket: "sparke-7lyyy6.appspot.com",
            messagingSenderId: "522401384798",
            appId: "1:522401384798:web:444bbf7070e14dd55a27cf"));
  } else {
    await Firebase.initializeApp();
  }
}
