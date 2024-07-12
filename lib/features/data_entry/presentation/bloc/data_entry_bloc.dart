import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/add_voter_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/address_field_typed_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/address_selected_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/change_address_entry_type_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/initial_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/new_scrapped_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/postcode_search_field_typed_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/remove_voter_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/save_voter_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/voter_field_typed_data_entry_usecase.dart';
import 'package:pappa_connect/features/data_entry/domain/usecases/website_loaded_data_entry_usecase.dart';

part 'data_entry_event.dart';
part 'data_entry_state.dart';

class DataEntryBloc extends Bloc<DataEntryEvent, DataEntryState> {
  final InitialDataEntryUseCase _initialDataEntryUseCase;
  final WebsiteLoadedDataEntryUseCase _websiteLoadedDataEntryUseCase;
  final ChangeAddressEntryTypeDataEntryUseCase
      _changeAddressEntryTypeDataEntryUseCase;
  final PostcodeSearchFieldTypedDataEntryUseCase
      _postcodeSearchFieldTypedDataEntryUseCase;
  final NewScrappedDataEntryUseCase _newScrappedDataEntryUseCase;
  final AddressSelectedDataEntryUseCase _addressSelectedDataEntryUseCase;
  final AddressFieldTypedDataEntryUseCase _addressFieldTypedDataEntryUseCase;
  final VoterFieldTypedDataEntryUseCase _voterFieldTypedDataEntryUseCase;
  final AddVoterDataEntryUseCase _addVoterDataEntryUseCase;
  final RemoveVoterDataEntryUseCase _removeVoterDataEntryUseCase;
  final SaveVoterDataEntryUseCase _saveVoterDataEntryUseCase;

  late Map<String, dynamic> dataEntryData;

  DataEntryBloc(
    this._initialDataEntryUseCase,
    this._websiteLoadedDataEntryUseCase,
    this._changeAddressEntryTypeDataEntryUseCase,
    this._postcodeSearchFieldTypedDataEntryUseCase,
    this._newScrappedDataEntryUseCase,
    this._addressSelectedDataEntryUseCase,
    this._addressFieldTypedDataEntryUseCase,
    this._voterFieldTypedDataEntryUseCase,
    this._addVoterDataEntryUseCase,
    this._removeVoterDataEntryUseCase,
    this._saveVoterDataEntryUseCase,
  ) : super(LoadingState()) {
    on<LoadedEvent>(loadedEvent);
    on<WebsiteLoadedEvent>(websiteLoadedEvent);
    on<ChangeAddressEntryTypeEvent>(changeAddressEntryTypeEvent);
    on<PostcodeSearchEvent>(postcodeSearchEvent);
    on<NewScrapedDataEvent>(newScrapedDataEvent);
    on<AddressSelectedEvent>(addressSelectedEvent);
    on<AddressFieldTypedEvent>(addressFieldTypedEvent);
    on<VoterFieldTypedEvent>(voterFieldTypedEvent);
    on<VoterFieldOptionSelectedEvent>(voterFieldOptionSelectedEvent);
    on<AddVoterEvent>(addVoterEvent);
    on<RemoveVoterEvent>(removeVoterEvent);
    on<ClearDataEvent>(clearDataEvent);
    on<SaveDataEvent>(saveDataEvent);
  }

  FutureOr<void> loadedEvent(
      LoadedEvent event, Emitter<DataEntryState> emit) async {
    dataEntryData = await _initialDataEntryUseCase();
    emit(LoadedState(dataEntryData: dataEntryData));
  }

  FutureOr<void> websiteLoadedEvent(
      WebsiteLoadedEvent event, Emitter<DataEntryState> emit) async {
    await _websiteLoadedDataEntryUseCase(params: {
      "data_entry_data": dataEntryData,
    });
    emit(LoadedState(dataEntryData: dataEntryData));
  }

  FutureOr<void> postcodeSearchEvent(
      PostcodeSearchEvent event, Emitter<DataEntryState> emit) async {
    await _postcodeSearchFieldTypedDataEntryUseCase(params: {
      "value": event.value,
      "scrape_address": event.scrapeAddress,
      "data_entry_data": dataEntryData,
    });
  }

  FutureOr<void> changeAddressEntryTypeEvent(
      ChangeAddressEntryTypeEvent event, Emitter<DataEntryState> emit) async {
    await _changeAddressEntryTypeDataEntryUseCase(
      params: {
        'type': event.type,
        'data_entry_data': dataEntryData,
      },
    );
    emit(LoadedState(dataEntryData: dataEntryData));
  }

  FutureOr<void> newScrapedDataEvent(
      NewScrapedDataEvent event, Emitter<DataEntryState> emit) async {
    await _newScrappedDataEntryUseCase(params: {
      "new_data": event.newData,
      "data_entry_data": dataEntryData,
    });
    emit(LoadedState(dataEntryData: dataEntryData));
  }

  FutureOr<void> addressSelectedEvent(
      AddressSelectedEvent event, Emitter<DataEntryState> emit) async {
    await _addressSelectedDataEntryUseCase(params: {
      "address": event.address,
      "data_entry_data": dataEntryData,
    });
    emit(LoadedState(dataEntryData: dataEntryData));
  }

  FutureOr<void> addressFieldTypedEvent(
      AddressFieldTypedEvent event, Emitter<DataEntryState> emit) async {
    await _addressFieldTypedDataEntryUseCase(
      params: {
        'field': event.field,
        'value': event.value,
        'data_entry_data': dataEntryData,
      },
    );
  }

  FutureOr<void> voterFieldTypedEvent(
      VoterFieldTypedEvent event, Emitter<DataEntryState> emit) async {
    await _voterFieldTypedDataEntryUseCase(
      params: {
        'index': event.index,
        'field': event.field,
        'value': event.value,
        'data_entry_data': dataEntryData,
      },
    );
  }

  FutureOr<void> voterFieldOptionSelectedEvent(
      VoterFieldOptionSelectedEvent event, Emitter<DataEntryState> emit) async {
    await _voterFieldTypedDataEntryUseCase(
      params: {
        'index': event.index,
        'field': event.field,
        'value': event.value,
        'data_entry_data': dataEntryData,
      },
    );
    emit(LoadedState(dataEntryData: dataEntryData));
  }

  FutureOr<void> addVoterEvent(
      AddVoterEvent event, Emitter<DataEntryState> emit) async {
    await _addVoterDataEntryUseCase(params: {
      'data_entry_data': dataEntryData,
    });
    emit(LoadedState(dataEntryData: dataEntryData));
  }

  FutureOr<void> removeVoterEvent(
      RemoveVoterEvent event, Emitter<DataEntryState> emit) async {
    await _removeVoterDataEntryUseCase(params: {
      'index': event.index,
      'data_entry_data': dataEntryData,
    });
    emit(LoadedState(dataEntryData: dataEntryData));
  }

  FutureOr<void> clearDataEvent(
      ClearDataEvent event, Emitter<DataEntryState> emit) async {
    bool isWebsiteLoaded = dataEntryData['is_website_loaded'];
    dataEntryData = await _initialDataEntryUseCase();
    dataEntryData['is_website_loaded'] = isWebsiteLoaded;
    emit(LoadedState(dataEntryData: dataEntryData));
  }

  FutureOr<void> saveDataEvent(
      SaveDataEvent event, Emitter<DataEntryState> emit) async {
    await _saveVoterDataEntryUseCase();
    dataEntryData = await _initialDataEntryUseCase();
    emit(LoadedState(dataEntryData: dataEntryData));
  }
}
