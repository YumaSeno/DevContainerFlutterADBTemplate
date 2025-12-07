part of 'home.dart';

class _TabletBody extends StatelessWidget {
  const _TabletBody({
    required this.viewModel,
    required this.nameController,
    required this.onIncrementLocalCounter,
  });

  final _ViewModel viewModel;
  final TextEditingController nameController;
  final VoidCallback onIncrementLocalCounter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('サンプル'),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final theme = ref.watch(currentThemeProvider);
              return IconButton(
                tooltip: 'テーマ切替',
                icon: Icon(
                  theme == ThemeMode.dark
                      ? Icons.dark_mode
                      : theme == ThemeMode.light
                          ? Icons.light_mode
                          : Icons.brightness_auto,
                ),
                onPressed: () {
                  final notifier = ref.read(currentThemeProvider.notifier);
                  if (theme == ThemeMode.system) {
                    notifier.set(ThemeMode.light);
                  } else if (theme == ThemeMode.light) {
                    notifier.set(ThemeMode.dark);
                  } else {
                    notifier.set(ThemeMode.system);
                  }
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1200.scaled(context)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Tablet 向け表示',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const ScaledSizedBox(height: 20),
              Padding(
                padding: EdgeInsetsGeometry.all(12.scaled(context)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10.scaled(context),
                      children: [
                        const Expanded(child: _TabletLocalCounter()),
                        const Expanded(child: _TabletExpenseSummary()),
                      ],
                    ),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Sample Controller (TextEditingController)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Tablet用: ローカルカウンタ表示部分
class _TabletLocalCounter extends ConsumerWidget {
  const _TabletLocalCounter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(_viewModelProvider.select((s) => s.localTapCount));
    return CounterCard(
      title: 'Local Tap (UiState)',
      description:
          'このカウンタは画面用UiStateで管理されます。\r\nPhone/Tabletどちらのレイアウトでも同じ値が共有されます。',
      count: count,
      onIncrement: () =>
          ref.read(_viewModelProvider.notifier).incrementLocalTapCount(),
      accentColor: Theme.of(context).colorScheme.secondary,
      icon: Icons.memory,
    );
  }
}

/// Tablet用: 経費サマリ表示部分
class _TabletExpenseSummary extends ConsumerWidget {
  const _TabletExpenseSummary();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_viewModelProvider.select(
      (s) => (s.monthlyTotalLabel, s.expenseCount),
    ));
    final vm = ref.read(_viewModelProvider.notifier);

    return ExpenseCard(
      title: 'Expenses (App)',
      description: 'このカウンタはアプリ全体で共有されます。別の画面からも値を参照・更新できます。',
      totalLabel: state.$1,
      itemCount: state.$2,
      onAddSample: vm.addSampleExpense,
      onClear: vm.clearExpenses,
    );
  }
}
