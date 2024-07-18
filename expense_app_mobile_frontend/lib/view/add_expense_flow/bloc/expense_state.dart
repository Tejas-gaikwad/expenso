part of 'expense_bloc.dart';

sealed class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object> get props => [];
}

class ExpenseInitialState extends ExpenseState {}

class AddExpenseLoadingState extends ExpenseState {}
class AddExpenseErrorState extends ExpenseState {
  final String? error;

  const AddExpenseErrorState({ this.error});

}
class AddExpenseSuccessState extends ExpenseState {}



class GetAllExpenseLoadingState extends ExpenseState {}

class  GetAllExpenseErrorState extends ExpenseState {
  final String? error;

  const  GetAllExpenseErrorState({ this.error});

}
class  GetAllExpenseSuccessState extends ExpenseState {
   final List<MyExpenseModel> list;

   const GetAllExpenseSuccessState({required this.list});
}


