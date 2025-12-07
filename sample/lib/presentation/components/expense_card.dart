import 'package:cariri/presentation/components/scaled_padding.dart';
import 'package:cariri/presentation/components/scaled_sizedbox.dart';
import 'package:cariri/presentation/utils.dart';
import 'package:flutter/material.dart';

/// 経費カードウィジェット
class ExpenseCard extends StatelessWidget {
  /// タイトル
  final String title;

  /// 説明文
  final String description;

  /// 合計ラベル
  final String totalLabel;

  /// アイテム数
  final int itemCount;

  /// サンプル追加時のコールバック
  final VoidCallback onAddSample;

  /// クリア時のコールバック
  final VoidCallback onClear;

  /// コンストラクタ
  const ExpenseCard({
    super.key,
    required this.title,
    required this.description,
    required this.totalLabel,
    required this.itemCount,
    required this.onAddSample,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.scaled(context)),
      ),
      child: ScaledPadding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const ScaledSizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const ScaledSizedBox(height: 16),
            Text(
              totalLabel,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const ScaledSizedBox(height: 8),
            Text(
              'Items: $itemCount',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const ScaledSizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 5.scaled(context),
              children: [
                ElevatedButton.icon(
                  onPressed: onAddSample,
                  icon: const Icon(Icons.add),
                  label: const Text('Add sample'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                OutlinedButton(onPressed: onClear, child: const Text('Clear')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
