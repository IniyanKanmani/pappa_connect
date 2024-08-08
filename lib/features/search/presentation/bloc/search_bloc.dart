import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pappa_connect/features/search/domain/usecases/initial_search_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final InitialSearchUsecase _initialSearchUsecase;

  late Map<String, dynamic> searchData;

  SearchBloc(this._initialSearchUsecase) : super(LoadingState()) {
    on<LoadedEvent>(loadedEvent);
    on<AddressSearchEvent>(addressSearchEvent);
    on<AddressSelectedEvent>(addressSelectedEvent);
    on<ClearDataEvent>(clearDataEvent);
    on<ModifyDataEvent>(modifyDataEvent);
    on<SaveDataEvent>(saveDataEvent);
  }

  FutureOr<void> loadedEvent(
      LoadedEvent event, Emitter<SearchState> emit) async {
    searchData = await _initialSearchUsecase();
    emit(LoadedState(searchData: searchData));
  }

  FutureOr<void> addressSearchEvent(
      AddressSearchEvent event, Emitter<SearchState> emit) async {}

  FutureOr<void> addressSelectedEvent(
      AddressSelectedEvent event, Emitter<SearchState> emit) async {}

  FutureOr<void> clearDataEvent(
      ClearDataEvent event, Emitter<SearchState> emit) async {}

  FutureOr<void> modifyDataEvent(
      ModifyDataEvent event, Emitter<SearchState> emit) async {}

  FutureOr<void> saveDataEvent(
      SaveDataEvent event, Emitter<SearchState> emit) async {}
}
