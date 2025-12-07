// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_total_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 月間合計ユースケース用のProvider

@ProviderFor(monthlyTotalUseCase)
const monthlyTotalUseCaseProvider = MonthlyTotalUseCaseProvider._();

/// 月間合計ユースケース用のProvider

final class MonthlyTotalUseCaseProvider
    extends $FunctionalProvider<MonthlyTotal, MonthlyTotal, MonthlyTotal>
    with $Provider<MonthlyTotal> {
  /// 月間合計ユースケース用のProvider
  const MonthlyTotalUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'monthlyTotalUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$monthlyTotalUseCaseHash();

  @$internal
  @override
  $ProviderElement<MonthlyTotal> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MonthlyTotal create(Ref ref) {
    return monthlyTotalUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MonthlyTotal value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MonthlyTotal>(value),
    );
  }
}

String _$monthlyTotalUseCaseHash() =>
    r'c1fa152a8905415dc3ca515912c5c93e5a51d32b';
