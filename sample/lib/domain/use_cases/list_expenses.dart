import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

/// 経費一覧取得ユースケース
class ListExpenses {
  /// 経費リポジトリ
  final ExpenseRepository repository;

  /// コンストラクタ
  ListExpenses(this.repository);

  /// 経費の一覧を取得します
  Future<List<Expense>> call() => repository.listExpenses();
}
