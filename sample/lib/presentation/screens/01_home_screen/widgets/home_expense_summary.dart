part of '../home_screen.dart';

/// 経費サマリー表示ウィジェット
class _ExpenseSummary extends ConsumerWidget {
  const _ExpenseSummary();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (monthlyTotalLabel, expenseCount) = ref.watch(
      _viewModelProvider.select(
        (s) => (s.requireValue.monthlyTotalLabel, s.requireValue.expenseCount),
      ),
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
