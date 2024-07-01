import 'package:expense_app/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/shared_prefs.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    _checkLoginStatus();
  }


  _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    print("_checkLoginStatus  ------   ${isLoggedIn}");

    if (isLoggedIn) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
              (route) => false,
        );
      });
    } else {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AuthScreen()),
              (route) => false,
        );
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    print("splash screen ---   ");
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
              Colors.white,
              const Color(0xffd6ecfd),
              const Color(0xffd6ecfd),
              const Color(0xffc5e3fc),
              const Color(0xffa5d4fa).withOpacity(0.8),
            ],
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.currency_exchange, size: 150, color: Colors.amber,)
              // Positioned(
              //   bottom: 0,
              //   left: 0,
              //   right: 0,
              //   child: Image.asset(
              //     AppImages.splashBg,
              //   ),
              // ),
              // Positioned(
              //   top: MediaQuery.of(context).size.height * 0.27,
              //   child: Image.asset(
              //     AppImages.appLogo,
              //     height: 200,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
