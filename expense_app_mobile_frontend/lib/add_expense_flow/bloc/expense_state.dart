part of 'expense_bloc.dart';

sealed class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object> get props => [];
}

class ExpenseInitialState extends ExpenseState {}

class AddExpenseLoadingState extends ExpenseState {}
class AddExpenseErrorState extends ExpenseState {}
class AddExpenseSuccessState extends ExpenseState {}


