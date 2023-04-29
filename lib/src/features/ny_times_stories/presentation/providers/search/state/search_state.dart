import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState.initial() = Initial;
  const factory SearchState.closeSearch() = CloseSearch;
  const factory SearchState.openSearch() = OpenSearch;
}
