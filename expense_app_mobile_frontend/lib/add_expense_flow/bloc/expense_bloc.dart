import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../repository/expense_repo.dart';
import '../../config/shared_prefs.dart';
import '../../core/logs/logger/app_logger.dart';
import '../../model/user_model.dart';
import '../../services/auth_services.dart';
part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepo expenseRepo;
  final AppLogger _appLogger;
  ExpenseBloc(this.expenseRepo, this._appLogger) : super(ExpenseInitialState()) {


    on<AddExpenseEvent>((event, emit) async {
      try {
        emit(AddExpenseLoadingState());
        final responseData = await expenseRepo.addExpense();
        final userParsedData = UserDataModel.fromJson(responseData.data);
        if (responseData.statusCode == '202') {
          emit(AddExpenseSuccessState());
        } else {
          emit(AddExpenseErrorState());
        }
      } catch (e) {
        print(" google login Error -->>    $e");
        emit( AddExpenseErrorState());
        return;
      }
    });


  }
}
