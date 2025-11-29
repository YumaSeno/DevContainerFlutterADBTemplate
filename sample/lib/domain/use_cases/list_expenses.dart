import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

class ListExpenses {
  final ExpenseRepository repository;
  ListExpenses(this.repository);

  Future<List<Expense>> call() => repository.listExpenses();
}
