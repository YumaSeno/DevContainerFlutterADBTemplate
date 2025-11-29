part of 'v01.dart';

class _TabletBody extends HookWidget {
  const _TabletBody();

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Tablet 向け表示',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: (context.w(50) - 16).clamp(0, 400),
                  child: CounterCard(
                    title: 'Hook (Local)',
                    description:
                        'このカウンタはローカル（ウィジェット内）にのみ影響します。画面外で値は管理されません。\r\nスマホ・タブレットの切替時にもリセットされます。',
                    count: countByHooks.value,
                    onIncrement: () => countByHooks.value++,
                    accentColor: Theme.of(context).colorScheme.secondary,
                    icon: Icons.memory,
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: (context.w(50) - 16).clamp(0, 400),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final state = ref.watch(_viewModelProvider);
                      return ExpenseCard(
                        title: 'Expenses (App)',
                        description: 'このカウンタはアプリ全体で共有されます。別の画面からも値を参照・更新できます。',
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
          ],
        ),
      ),
    );
  }
}
