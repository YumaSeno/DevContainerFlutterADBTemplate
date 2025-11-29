import '../entities/expense.dart';

abstract class ExpenseRepository {
  Future<List<Expense>> listExpenses();
  Future<void> addExpense(Expense e);
  Future<void> clear();
}
