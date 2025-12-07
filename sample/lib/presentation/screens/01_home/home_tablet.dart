part of 'home.dart';

class _TabletBody extends StatelessWidget {
  const _TabletBody({
    required this.nameController,
  });

  final TextEditingController nameController;

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

/// Tablet用: ローカルカウンタ表示
class _TabletLocalCounter extends ConsumerWidget {
  const _TabletLocalCounter();

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

/// Tablet用: 経費サマリ表示
class _TabletExpenseSummary extends ConsumerWidget {
  const _TabletExpenseSummary();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (monthlyTotalLabel, expenseCount) = ref.watch(
      _viewModelProvider.select((s) =>
          (s.requireValue.monthlyTotalLabel, s.requireValue.expenseCount)),
    );

    final vm = ref.read(_viewModelProvider.notifier);

    return ExpenseCard(
      title: 'Expenses (App)',
      description: 'この領域はドメイン（経費）ロジックのサンプルです。',
      totalLabel: monthlyTotalLabel,
      itemCount: expenseCount,
      onAddSample: vm.addSampleExpense,
      onClear: vm.clearExpenses,
    );
  }
}
