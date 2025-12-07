import 'package:cariri/domain/use_cases/list_expenses.dart';
import 'package:cariri/infrastructure/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_expenses_provider.g.dart';

/// 経費一覧取得ユースケース用のProvider
@riverpod
ListExpenses listExpensesUseCase(Ref ref) {
  final repo = ref.watch(expenseRepositoryProvider);
  return ListExpenses(repo);
}
