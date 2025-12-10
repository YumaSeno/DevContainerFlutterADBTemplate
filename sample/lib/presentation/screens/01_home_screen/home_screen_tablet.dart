part of 'home_screen.dart';

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
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
                        const Expanded(child: _HomeLocalCounter()),
                        const Expanded(child: _ExpenseSummary()),
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
