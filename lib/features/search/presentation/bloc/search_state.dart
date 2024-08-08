part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState({this.searchData});

  final Map<String, dynamic>? searchData;

  @override
  List<Object> get props => [
        Random().nextDouble(),
      ];
}

class SearchActionState extends SearchState {}

class LoadingState extends SearchState {}

class LoadedState extends SearchState {
  const LoadedState({super.searchData});
}

class ErrorState extends SearchActionState {}
