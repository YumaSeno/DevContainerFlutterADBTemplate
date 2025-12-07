import 'package:decimal/decimal.dart';
import '../repositories/expense_repository.dart';

/// 月間合計取得ユースケース
class MonthlyTotal {
  /// 経費リポジトリ
  final ExpenseRepository repository;

  /// コンストラクタ
  MonthlyTotal(this.repository);

  /// 指定した年月の経費合計を取得します
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
