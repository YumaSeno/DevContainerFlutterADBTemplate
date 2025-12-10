part of 'home_screen.dart';

@riverpod
class _ViewModel extends _$ViewModel with $AsyncNotifierMixin {
  // 1. buildメソッドをFuture型にし、初期化ロジックをここに書く
  @override
  Future<_UiState> build() async {
    return _fetchData(currentTapCount: 0);
  }

  // データ取得ロジックを抽出（再利用のため）
  Future<_UiState> _fetchData({required int currentTapCount}) async {
    final now = DateTime.now();

    // 経費一覧は ExpensesController から取得
    // - 直接 `.future` を await してしまうと一度解決した Future のみを参照して
    //   以降の更新が検知できなくなることがあるため、まず AsyncValue を watch
    //   して依存関係を作り、値がまだ無ければ future を await して初期値を取得します。
    final expenses =
        ref.watch(expensesControllerProvider).value ??
        (await ref.read(expensesControllerProvider.future))!;

    final total = ref.read(monthlyTotalControllerProvider(now.year, now.month));

    return _UiState(
      monthlyTotalLabel: formatYen(total),
      expenseCount: expenses.length,
      localTapCount: currentTapCount,
    );
  }

  // 2. データの追加処理
  Future<void> addSampleExpense() async {
    overlayController(ref).showLoading();

    try {
      //clearState();
      state = await AsyncValue.guard(() async {
        final now = DateTime.now();
        final e = Expense(
          id: now.microsecondsSinceEpoch.toString(),
          amount: Decimal.parse('1200'),
          date: now,
          category: 'Misc',
          note: 'Sample expense',
        );
        // Application 層の Controller に責務を委譲
        await ref.read(expensesControllerProvider.notifier).add(e);

        // データの再取得（現在のタップ数を維持したまま再取得）
        // 直前のデータが存在すればそのタップ数を、なければ0を使用
        final currentCount = state.value?.localTapCount ?? 0;
        return _fetchData(currentTapCount: currentCount);
      });
    } finally {
      overlayController(ref).hideLoading();
    }
  }

  // 3. データのクリア処理
  Future<void> clearExpenses() async {
    overlayController(ref).showLoading();

    try {
      //clearState();
      state = await AsyncValue.guard(() async {
        await ref.read(expensesControllerProvider.notifier).clear();

        // クリア後も一覧・月間合計を再取得して状態を更新
        final currentCount = state.value?.localTapCount ?? 0;
        return _fetchData(currentTapCount: currentCount);
      });
    } finally {
      overlayController(ref).hideLoading();
    }
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
