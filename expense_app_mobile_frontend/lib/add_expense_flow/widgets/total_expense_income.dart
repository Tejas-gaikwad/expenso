import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../utils/colors.dart';

class TotalExpenseIncome extends StatelessWidget {
  final double totalIncome;
  final double totalExpense;
  const TotalExpenseIncome({super.key, required this.totalIncome, required this.totalExpense});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimationConfiguration.synchronized(
            child: FadeInAnimation(
              child: SlideAnimation(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
                horizontalOffset: -30.0,
                child: expenseAndIncomeWidget(
                    rotation: 3,
                    type: 1,
                    amount: totalIncome,
                    label: "Total Income"
                ),
              ),
            ),
          ),
          AnimationConfiguration.synchronized(
            child: FadeInAnimation(
              child: SlideAnimation(
                horizontalOffset: 30.0,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
                child:  expenseAndIncomeWidget(
                    rotation: 1,
                    type: 0,
                    amount: totalExpense,
                    label: "Total Expense"
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget expenseAndIncomeWidget({
    required String label,
    required double amount,
    required int type,
    required int rotation,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(9),
          decoration:  BoxDecoration(
            color: type == 0 ? Colors.red :  Colors.green,
            shape: BoxShape.circle,
          ),
          child:  RotatedBox(
              quarterTurns: rotation,
              child: const Icon(Icons.arrow_back)),
        ),
        const SizedBox(width: 18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 12),),
            const SizedBox(height: 2),

            Text("₹${amount.toString()}", style: const TextStyle( fontWeight: FontWeight.bold, fontSize: 26, color: black),),
          ],
        ),


      ],
    );

  }
}
