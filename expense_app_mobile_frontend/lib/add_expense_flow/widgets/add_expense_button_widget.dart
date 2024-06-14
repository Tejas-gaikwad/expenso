import 'dart:convert';

import 'package:expense_app/home.dart';
import 'package:expense_app/model/my_expense_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../add_expense_success_screen.dart';

class AddExpenseButtonWidget extends StatefulWidget {
  final MyExpenseModel? expenseSummary;
  const AddExpenseButtonWidget({
    super.key,
    required this.expenseSummary,
  });

  @override
  State<AddExpenseButtonWidget> createState() => _AddExpenseButtonWidgetState();
}

class _AddExpenseButtonWidgetState extends State<AddExpenseButtonWidget> {





  void _addExpense({required MyExpenseModel? expenseSummary}) async {
    print("expenseSummary   ---------     ${expenseSummary}");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
          List<String> expenses = prefs.getStringList('my_expenses') ?? [];
          expenses.add(jsonEncode(expenseSummary?.toJson()));
          await prefs.setStringList('my_expenses', expenses);
          final list = await prefs.getStringList('my_expenses');
          print("List of expenses: $list");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Expense added successfully!'))
          );
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return const AddExpenseSuccessScreen();
            },
          ));
    } catch (err) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const Home();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _addExpense(expenseSummary: widget.expenseSummary);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: primaryColor,
          border: Border.all(color: primaryColor),
        ),
        child: const Text(
          "ADD EXPENSE",
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
