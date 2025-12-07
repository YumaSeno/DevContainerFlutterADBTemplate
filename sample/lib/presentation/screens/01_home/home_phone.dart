part of 'home.dart';

class _PhoneBody extends StatelessWidget {
  const _PhoneBody({
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
        child: ListView(
          children: [
            const Text(
              'Phone 向け表示',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const ScaledSizedBox(height: 16),
            ScaledPadding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 12.scaled(context),
                children: [
                  const _PhoneLocalCounter(),
                  const ScaledSizedBox(height: 8),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Sample Controller (TextEditingController)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const _PhoneExpenseSummary(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Phone用: ローカルカウンタ表示
class _PhoneLocalCounter extends ConsumerWidget {
  const _PhoneLocalCounter();

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
      icon: Icons.touch_app,
    );
  }
}

/// Phone用: 経費サマリ表示
class _PhoneExpenseSummary extends ConsumerWidget {
  const _PhoneExpenseSummary();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (monthlyTotalLabel, expenseCount) = ref.watch(
      _viewModelProvider.select((s) =>
          (s.requireValue.monthlyTotalLabel, s.requireValue.expenseCount)),
    );

    final vm = ref.read(_viewModelProvider.notifier);

    return SizedBox(
      width: double.infinity,
      child: ExpenseCard(
        title: 'Expenses (App)',
        description: 'この領域はドメイン（経費）ロジックのサンプルです。',
        totalLabel: monthlyTotalLabel,
        itemCount: expenseCount,
        onAddSample: vm.addSampleExpense,
        onClear: vm.clearExpenses,
      ),
    );
  }
}
