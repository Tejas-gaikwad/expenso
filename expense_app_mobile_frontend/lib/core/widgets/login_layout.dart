import 'package:flutter/material.dart';
import '../utils/app_images.dart';

class LoginLayout extends StatelessWidget {
  final Widget child;
  final bool isBack;
  const LoginLayout({super.key, required this.child, this.isBack = true});

  @override
  Widget build(BuildContext context) {
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
              Positioned(
                top: 60,
                bottom: 0,
                left: -30,
                right: 40,
                child: Image.asset(
                  AppImages.allBg,
                ),
              ),
              child,
              if (isBack)
                Align(
                  alignment: Alignment.topLeft,
                  child: SafeArea(
                    child: BackButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
