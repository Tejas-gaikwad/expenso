part of 'expense_bloc.dart';

sealed class ExpenseEvent extends Equatable {
  const ExpenseEvent();

  @override
  List<Object> get props => [];
}

class AddExpenseEvent extends ExpenseEvent {
  final String userId;
  const AddExpenseEvent({required this.userId});

  @override
  List<Object> get props => [];
}

