// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_total_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 指定年月の月間合計を計算する Controller

@ProviderFor(MonthlyTotalController)
const monthlyTotalControllerProvider = MonthlyTotalControllerFamily._();

/// 指定年月の月間合計を計算する Controller
final class MonthlyTotalControllerProvider
    extends $NotifierProvider<MonthlyTotalController, Decimal> {
  /// 指定年月の月間合計を計算する Controller
  const MonthlyTotalControllerProvider._({
    required MonthlyTotalControllerFamily super.from,
    required (int, int) super.argument,
  }) : super(
         retry: null,
         name: r'monthlyTotalControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$monthlyTotalControllerHash();

  @override
  String toString() {
    return r'monthlyTotalControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  MonthlyTotalController create() => MonthlyTotalController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Decimal value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Decimal>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MonthlyTotalControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$monthlyTotalControllerHash() =>
    r'e3a62ead9ae44aba9c7386322c4d04ff67799dfe';

/// 指定年月の月間合計を計算する Controller

final class MonthlyTotalControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          MonthlyTotalController,
          Decimal,
          Decimal,
          Decimal,
          (int, int)
        > {
  const MonthlyTotalControllerFamily._()
    : super(
        retry: null,
        name: r'monthlyTotalControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 指定年月の月間合計を計算する Controller

  MonthlyTotalControllerProvider call(int year, int month) =>
      MonthlyTotalControllerProvider._(argument: (year, month), from: this);

  @override
  String toString() => r'monthlyTotalControllerProvider';
}

/// 指定年月の月間合計を計算する Controller

abstract class _$MonthlyTotalController extends $Notifier<Decimal> {
  late final _$args = ref.$arg as (int, int);
  int get year => _$args.$1;
  int get month => _$args.$2;

  Decimal build(int year, int month);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2);
    final ref = this.ref as $Ref<Decimal, Decimal>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Decimal, Decimal>,
              Decimal,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
