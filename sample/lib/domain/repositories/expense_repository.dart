import '../entities/expense.dart';

/// 経費リポジトリインターフェース
abstract class ExpenseRepository {
  /// 経費の一覧を取得します
  Future<List<Expense>> listExpenses();

  /// 経費を追加します
  Future<void> addExpense(Expense e);

  /// 経費を削除します
  Future<void> clear();
}
