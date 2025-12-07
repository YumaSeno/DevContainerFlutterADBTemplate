import 'dart:convert';
import 'package:cariri/infrastructure/local_storage/local_storage.dart';
import 'package:cariri/domain/entities/expense.dart';
import 'package:cariri/domain/repositories/expense_repository.dart';

/// 経費リポジトリ実装
class ExpenseRepositoryImpl implements ExpenseRepository {
  @override
  Future<List<Expense>> listExpenses() async {
    final raw = PrefItems.expenses.get();
    return raw.map((s) {
      final m = json.decode(s) as Map<String, dynamic>;
      return Expense.fromJson(m);
    }).toList();
  }

  @override
  Future<void> addExpense(Expense e) async {
    final list = await listExpenses();
    list.add(e);
    final encoded = list.map((x) => json.encode(x.toJson())).toList();
    await PrefItems.expenses.set(encoded);
  }

  @override
  Future<void> clear() async {
    await PrefItems.expenses.set(const <String>[]);
  }
}
