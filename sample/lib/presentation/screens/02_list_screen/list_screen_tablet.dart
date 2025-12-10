part of 'list_screen.dart';

class _TabletBody extends StatelessWidget {
  const _TabletBody({required this.nameController});

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
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Tablet 向け表示',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              ScaledSizedBox(height: 20),
              Expanded(
                child: ScaledPadding(
                  padding: EdgeInsetsGeometry.all(12),
                  child: SizedBox(
                    height: 500,
                    child: SingleChildScrollView(child: _ExpenseList()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
