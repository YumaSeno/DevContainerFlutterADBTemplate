import 'package:decimal/decimal.dart';
import '../repositories/expense_repository.dart';

class MonthlyTotal {
  final ExpenseRepository repository;
  MonthlyTotal(this.repository);

  Future<Decimal> call(int year, int month) async {
    final list = await repository.listExpenses();
    Decimal sum = Decimal.zero;
    for (final e in list) {
      if (e.date.year == year && e.date.month == month) {
        sum += e.amount;
      }
    }
    return sum;
  }
}
