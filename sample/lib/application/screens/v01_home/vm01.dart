part of 'v01.dart';

@freezed
sealed class _UiState with _$UiState {
  const factory _UiState({
    required String monthlyTotalLabel,
    required int expenseCount,
  }) = __UiState;

  // factory _UiState.fromJson(Map<String, dynamic> json) =>
  //     _$UiStateFromJson(json);
}

@riverpod
final class _ViewModel extends _$ViewModel {
  @override
  _UiState build() {
    final initial = const _UiState(monthlyTotalLabel: '¥0', expenseCount: 0);

    // 非同期で永続化された経費一覧を読み込み、月合計を計算して反映
    Future(() async {
      final repo = ref.read(expenseRepositoryProvider);
      final list = await repo.listExpenses();
      final now = DateTime.now();
      var sum = 0;
      for (final e in list) {
        if (e.date.year == now.year && e.date.month == now.month) {
          sum += int.parse(e.amount.toString());
        }
      }
      state =
          state.copyWith(monthlyTotalLabel: '¥$sum', expenseCount: list.length);
    });

    return initial;
  }

  void addSampleExpense() {
    final repo = ref.read(expenseRepositoryProvider);
    Future(() async {
      final now = DateTime.now();
      final e = Expense(
        id: now.microsecondsSinceEpoch.toString(),
        amount: Decimal.parse('1200'),
        date: now,
        category: 'Misc',
        note: 'Sample expense',
      );
      await repo.addExpense(e);
      final list = await repo.listExpenses();
      var sum = 0;
      for (final ex in list) {
        if (ex.date.year == now.year && ex.date.month == now.month) {
          sum += int.parse(ex.amount.toString());
        }
      }
      state =
          state.copyWith(monthlyTotalLabel: '¥$sum', expenseCount: list.length);
    });
  }

  void clearExpenses() {
    final repo = ref.read(expenseRepositoryProvider);
    Future(() async {
      await repo.clear();
      state = state.copyWith(monthlyTotalLabel: '¥0', expenseCount: 0);
    });
  }
}
