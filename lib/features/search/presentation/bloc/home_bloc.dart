import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pappa_connect/features/home/domain/usecases/initial_home_usecase.dart';
import 'package:pappa_connect/features/home/domain/usecases/view_change_home_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final InitialHomeUseCase _initialHomeUseCase;
  final ViewChangeHomeUseCase _viewChangeHomeUseCase;

  HomeBloc(
    this._initialHomeUseCase,
    this._viewChangeHomeUseCase,
  ) : super(LoadingState()) {
    on<LoadedEvent>(loadedEvent);
    on<ViewChangeEvent>(viewChangeEvent);
  }

  FutureOr<void> loadedEvent(LoadedEvent event, Emitter<HomeState> emit) async {
    final Map<String, dynamic> homeData = await _initialHomeUseCase();
    emit(LoadedState(homeData: homeData));
  }

  FutureOr<void> viewChangeEvent(
      ViewChangeEvent event, Emitter<HomeState> emit) async {
    final Map<String, dynamic> homeData = await _viewChangeHomeUseCase(
      params: {'index': event.index, 'home_data': event.homeData},
    );
    emit(LoadedState(homeData: homeData));
  }
}
