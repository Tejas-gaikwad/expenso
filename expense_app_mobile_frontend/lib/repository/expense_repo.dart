import 'package:expense_app/services/auth_services.dart';

import '../core/logs/logger/app_logger.dart';
import '../model/api_response.dart';
import '../services/expense_services.dart';

class ExpenseRepo {

  final ExpenseService expenseServices;
  final AppLogger appLogger;
  ExpenseRepo({required this.expenseServices, required this.appLogger});

  Future<ApiResponse> addExpense() async {
    return expenseServices.addExpense();
  }
}