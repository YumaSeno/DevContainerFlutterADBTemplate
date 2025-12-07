part of 'home.dart';

@riverpod
class _ViewModel extends _$ViewModel {
  // 1. buildメソッドをFuture型にし、初期化ロジックをここに書く
  @override
  Future<_UiState> build() async {
    return _fetchData(currentTapCount: 0);
  }

  // データ取得ロジックを抽出（再利用のため）
  Future<_UiState> _fetchData({required int currentTapCount}) async {
    final listUseCase = ref.read(listExpensesUseCaseProvider);
    final totalUseCase = ref.read(monthlyTotalUseCaseProvider);
    final now = DateTime.now();

    // 並行取得でパフォーマンス向上（必要に応じて）
    final (expenses, total) =
        await (listUseCase(), totalUseCase(now.year, now.month)).wait;

    return _UiState(
      monthlyTotalLabel: formatYen(total),
      expenseCount: expenses.length,
      localTapCount: currentTapCount,
    );
  }

  // 2. データの追加処理
  Future<void> addSampleExpense() async {
    final addUseCase = ref.read(addExpenseUseCaseProvider);

    // UI側でローディング表示を出したい場合、stateをloadingにする
    state = const AsyncValue.loading();

    // guardを使うことで、try-catchを省略し、エラー時はstateがAsyncErrorになる
    state = await AsyncValue.guard(() async {
      final now = DateTime.now();
      final e = Expense(
        id: now.microsecondsSinceEpoch.toString(),
        amount: Decimal.parse('1200'),
        date: now,
        category: 'Misc',
        note: 'Sample expense',
      );
      await addUseCase(e);

      // データの再取得（現在のタップ数を維持したまま再取得）
      // 直前のデータが存在すればそのタップ数を、なければ0を使用
      final currentCount = state.value?.localTapCount ?? 0;
      return _fetchData(currentTapCount: currentCount);
    });
  }

  // 3. データのクリア処理
  Future<void> clearExpenses() async {
    final repo = ref.read(expenseRepositoryProvider);

    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await repo.clear();

      // クリア後の状態を返却
      final currentCount = state.value?.localTapCount ?? 0;
      return _UiState(
        monthlyTotalLabel: '¥0',
        expenseCount: 0,
        localTapCount: currentCount,
      );
    });
  }

  // 4. UI状態（タップカウント）のみの更新
  void incrementLocalTapCount() {
    // データがロード済みの場合のみ更新する
    if (state.hasValue) {
      final currentData = state.value!;
      state = AsyncData(
        currentData.copyWith(localTapCount: currentData.localTapCount + 1),
      );
    }
  }
}
