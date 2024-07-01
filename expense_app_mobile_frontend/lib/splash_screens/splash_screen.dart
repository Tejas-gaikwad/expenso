import 'package:flutter/material.dart';
import '../auth/auth_screen.dart';
import '../utils/colors.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});
  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
    _pageController.animateToPage(page, duration: const Duration(milliseconds: 600), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
            children: [
              PageView(
                controller: _pageController,
                  onPageChanged: _onPageChanged,
                  children: [
                    _buildSplashPage('assets/splash1.png', 'Take Control of Your Finances'),
                    _buildSplashPage('assets/splash2.png', 'Effortlessly Track Your Spending'),
                    _buildSplashPage('assets/splash3.png', 'Budget Smarter, Spend Wiser'),
                 ],
               ),
            ],
        ),
    );
  }

  Widget skipAndNextWidget() {
    if ((_currentPage == 2)) {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AuthScreen();
          },));
        },
        child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 800),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: neon,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text("Done",  textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: black),),
            ),
      );
    } else {
      return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          child: const Text("Skip",style: TextStyle(fontSize: 14, color: white),),
        ),
        InkWell(
          onTap: () {
            if(_currentPage == 0) {
              _onPageChanged(1);
            } else if (_currentPage == 1) {
              _onPageChanged(2);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            decoration: BoxDecoration(
              color: neon,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text("Next",style: TextStyle( fontWeight: FontWeight.bold, fontSize: 14, color: black),),
          ),
        ),
      ],
    );
    }
  }

  Widget _buildSplashPage(String imagePath, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Image.asset(imagePath),
          const SizedBox(height: 20),
          Text(
            text,
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color: white),
          ),
          const SizedBox(height: 120),
          skipAndNextWidget(),
        ],
      ),
    );
  }




}
