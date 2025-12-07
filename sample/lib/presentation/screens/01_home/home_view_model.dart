part of 'home.dart';

@riverpod
final class _ViewModel extends _$ViewModel {
  @override
  _UiState build() {
    // 初期状態ではユースケースはまだ実行しない
    // UI 側で明示的に読み込みアクションを呼び出す想定
    return const _UiState(
      monthlyTotalLabel: '¥0',
      expenseCount: 0,
      localTapCount: 0,
    );
  }

  /// 経費一覧と今月合計を読み込みます。
  ///
  /// Domain層のユースケース `ListExpenses` と `MonthlyTotal`
  /// を組み合わせて利用しているのがポイントです。
  Future<void> loadThisMonthSummary() async {
    final listUseCase = ref.read(listExpensesUseCaseProvider);
    final totalUseCase = ref.read(monthlyTotalUseCaseProvider);

    final now = DateTime.now();
    final expenses = await listUseCase();
    final total = await totalUseCase(now.year, now.month);

    state = state.copyWith(
      monthlyTotalLabel: formatYen(total),
      expenseCount: expenses.length,
    );
  }

  void addSampleExpense() {
    final addUseCase = ref.read(addExpenseUseCaseProvider);
    Future(() async {
      final now = DateTime.now();
      final e = Expense(
        id: now.microsecondsSinceEpoch.toString(),
        amount: Decimal.parse('1200'),
        date: now,
        category: 'Misc',
        note: 'Sample expense',
      );
      await addUseCase(e);
      await loadThisMonthSummary();
    });
  }

  void clearExpenses() {
    final repo = ref.read(expenseRepositoryProvider);
    Future(() async {
      await repo.clear();
      state = state.copyWith(
        monthlyTotalLabel: '¥0',
        expenseCount: 0,
      );
    });
  }

  /// 画面限定のローカルカウンタをインクリメントします。
  ///
  /// Domain層とは無関係なUI状態ですが、UiStateに含めることで
  /// Phone/Tabletどちらのレイアウトからも同じ値を利用できます。
  void incrementLocalTapCount() {
    state = state.copyWith(localTapCount: state.localTapCount + 1);
  }
}
