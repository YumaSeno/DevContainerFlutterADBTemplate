// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// アプリケーションのルーターを提供するプロバイダー

@ProviderFor(appRouter)
const appRouterProvider = AppRouterProvider._();

/// アプリケーションのルーターを提供するプロバイダー

final class AppRouterProvider
    extends $FunctionalProvider<Raw<AppRouter>, Raw<AppRouter>, Raw<AppRouter>>
    with $Provider<Raw<AppRouter>> {
  /// アプリケーションのルーターを提供するプロバイダー
  const AppRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRouterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRouterHash();

  @$internal
  @override
  $ProviderElement<Raw<AppRouter>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Raw<AppRouter> create(Ref ref) {
    return appRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<AppRouter> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<AppRouter>>(value),
    );
  }
}

String _$appRouterHash() => r'9269017152dd33017f9dcd0b2e06ca49c7284030';
