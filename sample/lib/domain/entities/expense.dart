import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense.freezed.dart';
part 'expense.g.dart';

@freezed
sealed class Expense with _$Expense {
  const factory Expense({
    required String id,
    required Decimal amount,
    required DateTime date,
    required String category,
    required String? note,
  }) = _Expense;

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);
}
