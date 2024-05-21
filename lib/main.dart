import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:auth_firebase/src/onboarding/welcome_screen/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyD-wrmNDO3k4f-BkfDJtWKVA8gxfQZAQOA",
      authDomain: "appauth-9d83d.firebaseapp.com",
      projectId: "appauth-9d83d",
      messagingSenderId: "38511431354",
      appId: "1:38511431354:web:594392338362b697c37c83",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: welcome_screen(),
    );
  }
}
