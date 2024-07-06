part of 'data_entry_bloc.dart';

abstract class DataEntryEvent extends Equatable {
  const DataEntryEvent();

  @override
  List<Object> get props => [];
}

class LoadedEvent extends DataEntryEvent {
  const LoadedEvent();
}

class AddressFieldTypedEvent extends DataEntryEvent {
  const AddressFieldTypedEvent({
    required this.field,
    required this.value,
    required this.dataEntryData,
  });

  final String field;
  final String value;
  final Map<String, dynamic> dataEntryData;
}

class VoterFieldTypedEvent extends DataEntryEvent {
  const VoterFieldTypedEvent({
    required this.index,
    required this.field,
    required this.value,
    required this.dataEntryData,
  });

  final int index;
  final String field;
  final String value;
  final Map<String, dynamic> dataEntryData;
}
