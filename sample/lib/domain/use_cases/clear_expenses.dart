import '../repositories/expense_repository.dart';

/// 経費全削除ユースケース
class ClearExpenses {
  /// 経費リポジトリ
  final ExpenseRepository repository;

  /// コンストラクタ
  ClearExpenses(this.repository);

  /// すべての経費を削除します
  Future<void> call() => repository.clear();
}
