import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllExpensesScreen extends StatefulWidget {
  const AllExpensesScreen({super.key});

  @override
  State<AllExpensesScreen> createState() => _AllExpensesScreenState();
}

class _AllExpensesScreenState extends State<AllExpensesScreen> {
  @override
  void initState() {
    super.initState();
    getAllExpenses();
  }

  Future getAllExpenses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> expenses = prefs.getStringList('expenses') ?? [];

    print("expenses ----------    ${expenses}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [],
      )),
    );
  }
}
