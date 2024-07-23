import '../core/config/shared_prefs.dart';
import '../core/logs/logger/app_logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/my_expense_model.dart';

class ExpenseService {
  final AppLogger appLogger;
  ExpenseService({required this.appLogger});

  Future<bool> addExpense({required MyExpenseModel? expenseSummary}) async {
    final uid = SharedPreferencesManager.getUserId();
    try {
      CollectionReference expensesCollection =
          FirebaseFirestore.instance.collection('expenses');
      DocumentReference expenseDocRef =
          await expensesCollection.add(expenseSummary?.toJson());
      String expenseId = expenseDocRef.id;
      DocumentReference userDocRef =
          FirebaseFirestore.instance.collection('users').doc(uid);
      CollectionReference userExpensesCollection =
          userDocRef.collection('expenses');
      await userExpensesCollection.doc(expenseId).set({'expenseId': expenseId});
      return true;
    } catch (err) {
      print("error -------   ${err}");
      return false;
    }
  }

  DateTime getFilterDateTime(String? filterType) {
    if (filterType == "day") {
      return DateTime.now();
    } else if (filterType == "month") {
      return DateTime(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day);
    } else if (filterType == "year") {
      return DateTime(
          DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);
    } else {
      return DateTime.now();
    }
  }

  Future<List<MyExpenseModel>> getExpenses({
    String? filterType,
  }) async {
    List<MyExpenseModel> expenses = [];
    final uid = SharedPreferencesManager.getUserId();
    try {
      QuerySnapshot expenseIdSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('expenses')
          .get();

      print(
          "expenseIdSnapshot.docs     -----------       ${expenseIdSnapshot.docs}");

      for (var doc in expenseIdSnapshot.docs) {
        String expenseId = doc.id;
        print('expenseId -----------     ${expenseId}');
        DocumentSnapshot expenseSnapshot = await FirebaseFirestore.instance
            .collection('expenses')
            .doc(expenseId)
            .get();

        if (expenseSnapshot.exists) {
          final data = expenseSnapshot.data();
          final myExpense =
              MyExpenseModel.fromJson(data as Map<String, dynamic>);

          final expenseDate = myExpense.dateTime;
          final filterDateTime = getFilterDateTime(filterType);
          print('filterType -----------     ${filterType}');

          if (filterType == null) {
            expenses.add(myExpense);
          } else {
            print('ilterType != "" -----------     ${myExpense.toJson()}');
            if (expenseDate!.isAfter(filterDateTime) &&
                expenseDate.isBefore(DateTime.now())) {
              expenses.add(myExpense);
            }
          }
          print('expenses -----------     ${expenses}');
        }
      }
      return expenses;
    } catch (e) {
      print('Error fetching expenses: $e');
    }

    return expenses;
  }
}
