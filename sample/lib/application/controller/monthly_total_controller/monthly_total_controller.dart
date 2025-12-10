import 'package:cariri/application/controller/expenses_controller/expenses_controller.dart';
import 'package:cariri/domain/services/monthly_total_calculator.dart';
import 'package:decimal/decimal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'monthly_total_controller.g.dart';

/// 指定年月の月間合計を計算する Controller
@riverpod
class MonthlyTotalController extends _$MonthlyTotalController {
  @override
  Decimal build(int year, int month) {
    final expensesState = ref.watch(expensesControllerProvider);

    final expenses = expensesState.value ?? const [];

    return calculateMonthlyTotal(expenses, year, month);
  }
}
