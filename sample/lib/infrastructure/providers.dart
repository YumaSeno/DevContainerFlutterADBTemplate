import 'package:cariri/domain/repositories/expense_repository.dart';
import 'package:cariri/infrastructure/repositories/expense_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// 経費リポジトリプロバイダー

@riverpod
ExpenseRepository expenseRepository(Ref ref) => ExpenseRepositoryImpl();
