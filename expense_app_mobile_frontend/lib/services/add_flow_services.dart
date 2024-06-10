import 'dart:math';

import 'package:expense_app/model/my_expense_model.dart';

class AddFlowServices {

  String generateRandomId(int length) {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  return String.fromCharCodes(Iterable.generate(
    length,
    (_) => characters.codeUnitAt(random.nextInt(characters.length)),
  ));
}


  MyExpenseModel addExpense({
    required int expenseType,
    required String amount,
    String? accountType,
    String? category,
    DateTime? dateTime,
    String? note,
  }) {

      String id = generateRandomId(6);

    
     final expense = MyExpenseModel(
      id: id,
                      type: expenseType,
                      amount:  double.parse(amount),
                      accountType: accountType,
                      category: category,
                      dateTime: dateTime ?? DateTime.now(),
                      note: note,
                    );
                    
                    return expense;
                    }
}