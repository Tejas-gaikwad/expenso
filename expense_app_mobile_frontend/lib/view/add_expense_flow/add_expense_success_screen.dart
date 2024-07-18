import 'package:expense_app/view/home/home.dart';
import 'package:expense_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AddExpenseSuccessScreen extends StatelessWidget {
  const AddExpenseSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Success",
          style: TextStyle(
              color: white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              SizedBox(
                  height: 100,
                  child: Lottie.asset('assets/success_animation.json')),
              const SizedBox(height: 20),
              const Text("Expense Added Successfully",
                  style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16)),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Home();
                      },
                    ),
                    (route) => false,
                  );
                },
                child: Container(
                  child: const Text(
                    "Home",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
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
