part of 'expense_bloc.dart';

sealed class ExpenseEvent extends Equatable {
  const ExpenseEvent();

  @override
  List<Object> get props => [];
}

class AddExpenseEvent extends ExpenseEvent {
  final MyExpenseModel? expenseData;
  const AddExpenseEvent({required this.expenseData});

  @override
  List<Object> get props => [];
}

class GetAllExpenseEvent extends ExpenseEvent {
  final String? filterType;
  const GetAllExpenseEvent({this.filterType});
  @override
  List<Object> get props => [];
}
