part of 'list_screen.dart';

@freezed
sealed class _UiState with _$UiState {
  const factory _UiState({required List<Expense> expenses}) = __UiState;

  // factory _UiState.fromJson(Map<String, dynamic> json) =>
  //     _$UiStateFromJson(json);
}
