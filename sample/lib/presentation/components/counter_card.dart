import 'package:cariri/presentation/components/scaled_padding.dart';
import 'package:cariri/presentation/components/scaled_sizedbox.dart';
import 'package:cariri/presentation/utils.dart';
import 'package:flutter/material.dart';

/// カウンターカードウィジェット
class CounterCard extends StatelessWidget {
  /// タイトル
  final String title;

  /// 説明文
  final String description;

  /// カウント値
  final int count;

  /// インクリメント時のコールバック
  final VoidCallback onIncrement;

  /// アクセントカラー
  final Color? accentColor;

  /// アイコン
  final IconData? icon;

  /// コンストラクタ
  const CounterCard({
    super.key,
    required this.title,
    required this.description,
    required this.count,
    required this.onIncrement,
    this.accentColor,
    this.icon,
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
              count.toString(),
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const ScaledSizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: onIncrement,
              icon: const Icon(Icons.add),
              label: const Text('Increment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
