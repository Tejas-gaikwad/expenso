import '../core/logs/logger/app_logger.dart';
import '../model/my_expense_model.dart';
import '../services/expense_services.dart';

class ExpenseRepo {

  final ExpenseService expenseServices;
  final AppLogger appLogger;
  ExpenseRepo({required this.expenseServices, required this.appLogger});

  Future<bool> addExpense({
    required MyExpenseModel? expenseSummary
  }) async {
    return expenseServices.addExpense(expenseSummary: expenseSummary);
  }

  Future<List<MyExpenseModel>> getExpenses() async {
    return expenseServices.getExpenses();
  }

  
}