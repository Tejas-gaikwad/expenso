import 'package:bloc/bloc.dart';
import 'package:expense_app/home.dart';
import 'package:expense_app/splash_screen.dart';
import 'package:expense_app/splash_screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'auth/auth_screen.dart';
import 'config/shared_prefs.dart';
import 'core/di/app_dependency_injection.dart';
import 'core/logs/bloc_observer/app_bloc_observer.dart';
import 'core/logs/logger/app_logger.dart';
import 'core/logs/logger/logger_modules/devtools_logger_module.dart';

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
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  AppLogger.createInstance([
    DevToolsLoggerModule(),
  ]);

  SharedPreferencesManager.init();

  AppDependencyInjection.initDiServices();
    if (kDebugMode) {
        Bloc.observer = AppBlocObserver();
        runApp(const MyApp());
      } else {
        runApp(const MyApp());
      } (error, stackTrace) async {
      AppLogger.getInstance.logError(
       error,
       stackTrace: stackTrace,
       fatal: true,
      );
    };
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
      home: SplashScreen(),
      // AuthScreen(),
      // Home(),
      // SplashScreen(),
      // const AuthScreen(),
    );
  }
}
