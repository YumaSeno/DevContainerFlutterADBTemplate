import 'package:cariri/domain/use_cases/add_expense.dart';
import 'package:cariri/infrastructure/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_expense_provider.g.dart';

/// 経費追加ユースケース用のProvider
@riverpod
AddExpense addExpenseUseCase(Ref ref) {
  final repo = ref.watch(expenseRepositoryProvider);
  return AddExpense(repo);
}
