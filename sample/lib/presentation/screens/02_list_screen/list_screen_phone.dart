part of 'list_screen.dart';

class _PhoneBody extends StatelessWidget {
  const _PhoneBody({required this.nameController});

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
            const ScaledPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
              child: _ExpenseList(),
            ),
          ],
        ),
      ),
    );
  }
}
