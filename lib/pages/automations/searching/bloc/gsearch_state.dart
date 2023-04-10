part of 'gsearch_bloc.dart';

class GsearchState extends Equatable {
  bool isLoaded;
  String searchValue;

  GsearchState({
    this.isLoaded = false,
    this.searchValue = '',
  });

  GsearchState copyWith({bool? isLoaded, String? searchValue}) {
    return GsearchState(
        isLoaded: isLoaded ?? this.isLoaded,
        searchValue: searchValue ?? this.searchValue);
  }

  @override
  List<Object> get props => [isLoaded, searchValue];
}
