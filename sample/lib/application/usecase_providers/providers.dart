import 'package:cariri/domain/use_cases/add_expense.dart';
import 'package:cariri/domain/use_cases/clear_expenses.dart';
import 'package:cariri/domain/use_cases/list_expenses.dart';
import 'package:cariri/infrastructure/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

// 現在はUsecaseが少ないため、1ファイルにまとめています。
// 将来的にUsecaseが増えたら、個別ファイルに分割してください。

/// 経費追加用の UseCase Provider
@riverpod
AddExpense addExpenseUseCase(Ref ref) =>
    AddExpense(ref.watch(expenseRepositoryProvider));

/// 経費全削除用の UseCase Provider
@riverpod
ClearExpenses clearExpensesUseCase(Ref ref) =>
    ClearExpenses(ref.watch(expenseRepositoryProvider));

/// 経費一覧取得用の UseCase Provider
@riverpod
ListExpenses listExpensesUseCase(Ref ref) =>
    ListExpenses(ref.watch(expenseRepositoryProvider));
