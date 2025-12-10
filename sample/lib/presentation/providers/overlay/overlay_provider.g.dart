// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overlay_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ローディングオーバーレイの状態

@ProviderFor(LoadingOverlay)
const loadingOverlayProvider = LoadingOverlayProvider._();

/// ローディングオーバーレイの状態
final class LoadingOverlayProvider
    extends $NotifierProvider<LoadingOverlay, bool> {
  /// ローディングオーバーレイの状態
  const LoadingOverlayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loadingOverlayProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loadingOverlayHash();

  @$internal
  @override
  LoadingOverlay create() => LoadingOverlay();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$loadingOverlayHash() => r'961c792f5f3736df34d7727dcab4b08ed747d81b';

/// ローディングオーバーレイの状態

abstract class _$LoadingOverlay extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// ボトムナビゲーションの表示状態

@ProviderFor(BottomNavigationVisibility)
const bottomNavigationVisibilityProvider =
    BottomNavigationVisibilityProvider._();

/// ボトムナビゲーションの表示状態
final class BottomNavigationVisibilityProvider
    extends $NotifierProvider<BottomNavigationVisibility, bool> {
  /// ボトムナビゲーションの表示状態
  const BottomNavigationVisibilityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bottomNavigationVisibilityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bottomNavigationVisibilityHash();

  @$internal
  @override
  BottomNavigationVisibility create() => BottomNavigationVisibility();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$bottomNavigationVisibilityHash() =>
    r'02d841a357224a0eee8cb1f712c8b9d413da7dc4';

/// ボトムナビゲーションの表示状態

abstract class _$BottomNavigationVisibility extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// オーバーレイコントローラーのプロバイダー

@ProviderFor(overlayController)
const overlayControllerProvider = OverlayControllerProvider._();

/// オーバーレイコントローラーのプロバイダー

final class OverlayControllerProvider
    extends
        $FunctionalProvider<
          OverlayController,
          OverlayController,
          OverlayController
        >
    with $Provider<OverlayController> {
  /// オーバーレイコントローラーのプロバイダー
  const OverlayControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'overlayControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$overlayControllerHash();

  @$internal
  @override
  $ProviderElement<OverlayController> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OverlayController create(Ref ref) {
    return overlayController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OverlayController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OverlayController>(value),
    );
  }
}

String _$overlayControllerHash() => r'e55670570d0fc5f9f3ccc71ff7205832b405cb71';
