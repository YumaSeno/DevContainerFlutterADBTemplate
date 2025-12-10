part of 'list_screen.dart';

@riverpod
class _ViewModel extends _$ViewModel {
  // 1. buildメソッドをFuture型にし、初期化ロジックをここに書く
  @override
  Future<_UiState> build() async {
    final expenses =
        ref.watch(expensesControllerProvider).value ??
        (await ref.read(expensesControllerProvider.future))!;

    return _UiState(expenses: expenses);
  }
}
