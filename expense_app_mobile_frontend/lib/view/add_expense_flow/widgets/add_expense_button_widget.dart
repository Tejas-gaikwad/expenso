import 'package:expense_app/core/di/app_dependency_injection.dart';
import 'package:expense_app/model/my_expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/colors.dart';
import '../add_expense_success_screen.dart';
import '../bloc/expense_bloc.dart';

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
  final ExpenseBloc expenseBloc = AppDependencyInjection.getIt.get();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: expenseBloc,
      builder: (context, state) {
        return InkWell(
          onTap: () {
            if (widget.expenseSummary != null) {
              expenseBloc
                  .add(AddExpenseEvent(expenseData: widget.expenseSummary));
            }
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: primaryColor,
              border: Border.all(color: primaryColor),
            ),
            child: (state is AddExpenseLoadingState)
                ? const Center(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const Text(
                    "ADD EXPENSE",
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        );
      },
      listener: (context, state) {
        if (state is AddExpenseSuccessState) {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return const AddExpenseSuccessScreen();
            },
          ));
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Expense added successfully!')));
        }

        if (state is AddExpenseErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error ?? "Error, Something went wrong")));
        }
      },
    );
  }
}
