import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cariri/domain/repositories/expense_repository.dart';
import 'package:cariri/infrastructure/repositories/expense_repository_impl.dart';

/// 経費リポジトリプロバイダー
final expenseRepositoryProvider = Provider<ExpenseRepository>((ref) {
  return ExpenseRepositoryImpl();
});
