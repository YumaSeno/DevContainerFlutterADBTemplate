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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10.scaled(context),
                  children: [
                    Expanded(
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
                    Expanded(
                      child: Consumer(
                        builder: (context, ref, child) {
                          final state = ref.watch(_viewModelProvider);
                          return ExpenseCard(
                            title: 'Expenses (App)',
                            description:
                                'このカウンタはアプリ全体で共有されます。別の画面からも値を参照・更新できます。',
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
      ),
    );
  }
}
