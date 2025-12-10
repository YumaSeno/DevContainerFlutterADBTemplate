import 'package:cariri/domain/entities/expense.dart';
import 'package:decimal/decimal.dart';

/// 経費一覧から指定年月の月間合計を計算するドメインサービス
Decimal calculateMonthlyTotal(Iterable<Expense> expenses, int year, int month) {
  var sum = Decimal.zero;
  for (final e in expenses) {
    if (e.date.year == year && e.date.month == month) {
      sum += e.amount;
    }
  }
  return sum;
}
