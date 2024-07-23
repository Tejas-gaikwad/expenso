import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_app/model/my_expense_model.dart';
import '../../../repository/expense_repo.dart';
import '../../../core/logs/logger/app_logger.dart';
part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepo expenseRepo;
  final AppLogger _appLogger;
  ExpenseBloc(this.expenseRepo, this._appLogger)
      : super(ExpenseInitialState()) {
    on<AddExpenseEvent>((event, emit) async {
      try {
        emit(AddExpenseLoadingState());

        final res =
            await expenseRepo.addExpense(expenseSummary: event.expenseData);
        if (res) {
          emit(AddExpenseSuccessState());
        } else {
          emit(const AddExpenseErrorState());
        }
      } catch (e) {
        print(" Add expense Error -->>    $e");
        emit(const AddExpenseErrorState());
        return;
      }
    });

    on<GetAllExpenseEvent>((event, emit) async {
      try {
        emit(GetAllExpenseLoadingState());

        final res = await expenseRepo.getExpenses(filterType: event.filterType);
        if (res.isNotEmpty) {
          emit(GetAllExpenseSuccessState(list: res));
        } else {
          emit(const GetAllExpenseSuccessState(list: []));
        }
      } catch (e) {
        print(" GetAllExpenseErrorState Error -->>    $e");
        emit(const GetAllExpenseErrorState());
        return;
      }
    });
  }
}
