import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

/// 経費追加ユースケース
class AddExpense {
  /// 経費リポジトリ
  final ExpenseRepository repository;

  /// コンストラクタ
  AddExpense(this.repository);

  /// 経費を追加します
  Future<void> call(Expense e) => repository.addExpense(e);
}
