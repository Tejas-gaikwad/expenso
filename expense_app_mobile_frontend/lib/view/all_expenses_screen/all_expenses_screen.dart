import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/di/app_dependency_injection.dart';
import '../../core/utils/colors.dart';
import '../../model/my_expense_model.dart';
import '../add_expense_flow/bloc/expense_bloc.dart';

class AllExpensesScreen extends StatefulWidget {
  const AllExpensesScreen({super.key});

  @override
  State<AllExpensesScreen> createState() => _AllExpensesScreenState();
}

class _AllExpensesScreenState extends State<AllExpensesScreen> {
  ExpenseBloc expenseBloc = AppDependencyInjection.getIt.get();

  @override
  void initState() {
    super.initState();
    // controller = AnimationController(vsync: this);
    expenseBloc.add(const GetAllExpenseEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("All Expenses"),
        ),
        body: SafeArea(
            child: BlocConsumer(
          bloc: expenseBloc,
          builder: (context, state) {
            if (state is GetAllExpenseLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is GetAllExpenseSuccessState) {
              double totalExpense = 0.0;
              double totalIncome = 0.0;

              final list = state.list;

              if ((list).isNotEmpty) {
                for (int i = 0; i <= list.length - 1; i++) {
                  final expense = list[i];
                  final amount = expense.amount ?? 0.0;
                  if (expense.type == 0) {
                    totalExpense = (amount + totalExpense);
                  } else if (expense.type == 1) {
                    totalIncome = (amount + totalIncome);
                  }
                }
              }

              return mainScreen(
                list: list,
                totalExpense: totalExpense,
                totalIncome: totalIncome,
              );
            }
            return mainScreen();
          },
          listener: (context, state) {
            if (state is GetAllExpenseErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Error, Something went wrong.")));
            }
          },
        )));
  }

  Widget mainScreen({
    double? totalExpense,
    double? totalIncome,
    List<MyExpenseModel>? list,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        ((list ?? []).isEmpty)
            ? Center(
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 4,
                  width: double.infinity,
                  child: const Text(
                    "No Transactions Available",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              )
            : AnimationLimiter(
                child: Expanded(
                  child: ListView.builder(
                    itemCount: ((list ?? []).length < 3) ? list?.length : 3,
                    itemBuilder: (context, index) {
                      final expense = list?[index];
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              decoration: BoxDecoration(
                                color: containerColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: const Icon(
                                      Icons.category_outlined,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          expense?.category ?? "Unknown",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          maxLines: 1,
                                        ),
                                        expense?.dateTime == null
                                            ? const Text("")
                                            : Text(
                                                DateFormat("MMM yyyy").format(
                                                    expense?.dateTime ??
                                                        DateTime.now()),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12,
                                                    color: Colors.black54),
                                                maxLines: 1,
                                              ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "₹${expense?.amount.toString()}",
                                    style: TextStyle(
                                        color: expense?.type == 0
                                            ? Colors.red
                                            : expense?.type == 1
                                                ? Colors.green
                                                : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
      ],
    );
  }
}
