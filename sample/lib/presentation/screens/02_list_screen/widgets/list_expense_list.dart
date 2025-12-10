part of '../list_screen.dart';

/// 経費一覧を表示する汎用ウィジェット
class _ExpenseList extends ConsumerWidget {
  const _ExpenseList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenses = ref.watch(
      _viewModelProvider.select((s) => s.requireValue.expenses),
    );

    return expenses.isEmpty
        ? const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('経費はまだ登録されていません。'),
          )
        : ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: expenses.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final e = expenses[index];
              return ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${e.date.year}/${e.date.month}/${e.date.day}'),
                  ],
                ),
                title: Text(e.category),
                subtitle: Text(e.note ?? ''),
                trailing: Text(formatYen(e.amount)),
              );
            },
          );
  }
}
