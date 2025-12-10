part of '../home_screen.dart';

/// 画面ローカルのカウンタ表示ウィジェット
class _HomeLocalCounter extends ConsumerWidget {
  const _HomeLocalCounter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(
      _viewModelProvider.select((s) => s.requireValue.localTapCount),
    );

    final vm = ref.read(_viewModelProvider.notifier);

    return CounterCard(
      title: 'Local Tap (UiState)',
      description: 'このカウンタは画面用UiStateで管理されます。',
      count: count,
      onIncrement: vm.incrementLocalTapCount,
      accentColor: Theme.of(context).colorScheme.secondary,
      icon: Icons.memory,
    );
  }
}
