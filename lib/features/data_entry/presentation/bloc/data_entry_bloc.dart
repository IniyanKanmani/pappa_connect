import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/address_field_typed_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/initial_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/voter_field_typed_data_entry_usecase.dart';

part 'data_entry_event.dart';
part 'data_entry_state.dart';

class DataEntryBloc extends Bloc<DataEntryEvent, DataEntryState> {
  final InitialDataEntryUseCase _initialDataEntryUseCase;
  final AddressFieldTypedDataEntryUseCase _addressFieldTypedDataEntryUseCase;
  final VoterFieldTypedDataEntryUseCase _voterFieldTypedDataEntryUseCase;

  DataEntryBloc(
    this._initialDataEntryUseCase,
    this._addressFieldTypedDataEntryUseCase,
    this._voterFieldTypedDataEntryUseCase,
  ) : super(LoadingState()) {
    on<LoadedEvent>(loadedEvent);
    on<AddressFieldTypedEvent>(addressFieldTypedEvent);
    on<VoterFieldTypedEvent>(voterFieldTypedEvent);
  }

  FutureOr<void> loadedEvent(
      LoadedEvent event, Emitter<DataEntryState> emit) async {
    final Map<String, dynamic> dataEntryData = await _initialDataEntryUseCase();
    emit(LoadedState(dataEntryData: dataEntryData));
  }

  FutureOr<void> addressFieldTypedEvent(
      AddressFieldTypedEvent event, Emitter<DataEntryState> emit) async {
    final Map<String, dynamic> dataEntryData =
        await _addressFieldTypedDataEntryUseCase(
      params: {
        'field': event.field,
        'value': event.value,
        'data_entry_data': event.dataEntryData,
      },
    );
    // emit(LoadedState(dataEntryData: dataEntryData));
  }

  FutureOr<void> voterFieldTypedEvent(
      VoterFieldTypedEvent event, Emitter<DataEntryState> emit) async {
    final Map<String, dynamic> dataEntryData =
        await _voterFieldTypedDataEntryUseCase(
      params: {
        'index': event.index,
        'field': event.field,
        'value': event.value,
        'data_entry_data': event.dataEntryData,
      },
    );
    emit(LoadedState(dataEntryData: dataEntryData));
  }
}
