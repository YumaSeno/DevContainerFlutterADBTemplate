part of 'v01.dart';

class _PhoneBody extends HookWidget {
  const _PhoneBody();

  @override
  Widget build(BuildContext context) {
    // Flutter Hooksによる状態（Local State）を取得
    final countByHooks = useState(0);

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
                  SizedBox(
                    width: double.infinity,
                    child: CounterCard(
                      title: 'Hook (Local)',
                      description:
                          'このカウンタはローカル（ウィジェット内）にのみ影響します。画面外で値は管理されません。\r\nスマホ・タブレットの切替時にもリセットされます。',
                      count: countByHooks.value,
                      onIncrement: () => countByHooks.value++,
                      accentColor: Theme.of(context).colorScheme.secondary,
                      icon: Icons.build,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Consumer(
                      builder: (context, ref, child) {
                        final state = ref.watch(_viewModelProvider);
                        return ExpenseCard(
                          title: 'Expenses (App)',
                          description: 'この領域はドメイン（経費）ロジックのサンプルです。',
                          totalLabel: state.monthlyTotalLabel,
                          itemCount: state.expenseCount,
                          onAddSample: () => ref
                              .read(_viewModelProvider.notifier)
                              .addSampleExpense(),
                          onClear: () => ref
                              .read(_viewModelProvider.notifier)
                              .clearExpenses(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
