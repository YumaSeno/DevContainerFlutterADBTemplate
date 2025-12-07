part of 'home.dart';

class _PhoneBody extends StatelessWidget {
  const _PhoneBody({
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
        child: ListView(
          children: [
            Text(
              'Phone 向け表示',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const ScaledSizedBox(height: 16),
            ScaledPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
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

/// Phone用: ローカルカウンタ表示部分だけがUiState.localTapCountを購読
class _PhoneLocalCounter extends ConsumerWidget {
  const _PhoneLocalCounter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(_viewModelProvider.select((s) => s.localTapCount));
    return SizedBox(
      width: double.infinity,
      child: CounterCard(
        title: 'Local Tap (UiState)',
        description:
            'このカウンタは画面用UiStateで管理されます。\r\nPhone/Tabletどちらのレイアウトでも同じ値が共有されます。',
        count: count,
        onIncrement: () =>
            ref.read(_viewModelProvider.notifier).incrementLocalTapCount(),
        accentColor: Theme.of(context).colorScheme.secondary,
        icon: Icons.touch_app,
      ),
    );
  }
}

/// Phone用: 経費サマリ表示部分だけがmonthlyTotalLabel/expenseCountを購読
class _PhoneExpenseSummary extends ConsumerWidget {
  const _PhoneExpenseSummary();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_viewModelProvider.select(
      (s) => (s.monthlyTotalLabel, s.expenseCount),
    ));
    final vm = ref.read(_viewModelProvider.notifier);

    return SizedBox(
      width: double.infinity,
      child: ExpenseCard(
        title: 'Expenses (App)',
        description: 'この領域はドメイン（経費）ロジックのサンプルです。',
        totalLabel: state.$1,
        itemCount: state.$2,
        onAddSample: vm.addSampleExpense,
        onClear: vm.clearExpenses,
      ),
    );
  }
}
