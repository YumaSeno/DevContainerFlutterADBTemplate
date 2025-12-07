import 'package:cariri/domain/use_cases/monthly_total.dart';
import 'package:cariri/infrastructure/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'monthly_total_provider.g.dart';

/// 月間合計ユースケース用のProvider
@riverpod
MonthlyTotal monthlyTotalUseCase(Ref ref) {
  final repo = ref.watch(expenseRepositoryProvider);
  return MonthlyTotal(repo);
}
