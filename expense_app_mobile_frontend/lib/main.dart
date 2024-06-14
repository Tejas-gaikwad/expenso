import 'package:expense_app/home.dart';
import 'package:expense_app/splash_screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'auth/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAWVQwA93VdDkwYsajIbZ3i6Mn1cwAxSVA",
        appId: "1:350232009227:android:73fbd07b3dd27a959a050e",
        messagingSenderId: "350232009227",
        projectId: "expenso-ddadd",
        storageBucket: "expenso-ddadd.appspot.com",
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
      // SplashScreen(),
      // const AuthScreen(),
    );
  }
}
