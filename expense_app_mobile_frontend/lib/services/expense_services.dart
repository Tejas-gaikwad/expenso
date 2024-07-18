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

  Future<List<MyExpenseModel>> getExpenses() async {
    List<MyExpenseModel> expenses = [];
    final uid = SharedPreferencesManager.getUserId();

    try {
      QuerySnapshot expenseIdSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('expenses')
          .get();

      for (var doc in expenseIdSnapshot.docs) {
        String expenseId = doc.id;

        // Fetch the expense details from the expenses collection
        DocumentSnapshot expenseSnapshot = await FirebaseFirestore.instance
            .collection('expenses')
            .doc(expenseId)
            .get();

        print("expenseSnapshot     -----------       $expenseSnapshot");

        if (expenseSnapshot.exists) {
          final data = expenseSnapshot.data();

          print("data     -----------       $data");

          final myExpense =
              MyExpenseModel.fromJson(data as Map<String, dynamic>);

          print("myExpense     -----------       $myExpense");

          expenses.add(myExpense);
        }
      }
    } catch (e) {
      print('Error fetching expenses: $e');
    }

    return expenses;
  }
}
