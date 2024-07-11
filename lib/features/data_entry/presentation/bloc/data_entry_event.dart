part of 'data_entry_bloc.dart';

abstract class DataEntryEvent extends Equatable {
  const DataEntryEvent();

  @override
  List<Object> get props => [];
}

class LoadedEvent extends DataEntryEvent {
  const LoadedEvent();
}

class WebsiteLoadedEvent extends DataEntryEvent {
  const WebsiteLoadedEvent();
}

class ChangeAddressEntryTypeEvent extends DataEntryEvent {
  const ChangeAddressEntryTypeEvent({
    required this.type,
  });

  final String type;
}

class PostcodeSearchEvent extends DataEntryEvent {
  const PostcodeSearchEvent({
    required this.value,
    required this.scrapeAddress,
  });

  final String value;
  final Function(String) scrapeAddress;
}

class NewScrapedDataEvent extends DataEntryEvent {
  const NewScrapedDataEvent({
    required this.newData,
  });

  final String newData;
}

class AddressSelectedEvent extends DataEntryEvent {
  const AddressSelectedEvent({
    required this.address,
  });

  final String address;
}

class AddressFieldTypedEvent extends DataEntryEvent {
  const AddressFieldTypedEvent({
    required this.field,
    required this.value,
  });

  final String field;
  final String value;
}

class VoterFieldTypedEvent extends DataEntryEvent {
  const VoterFieldTypedEvent({
    required this.index,
    required this.field,
    required this.value,
  });

  final int index;
  final String field;
  final String value;
}

class VoterFieldOptionSelectedEvent extends DataEntryEvent {
  const VoterFieldOptionSelectedEvent({
    required this.index,
    required this.field,
    required this.value,
  });

  final int index;
  final String field;
  final String? value;
}

class AddVoterEvent extends DataEntryEvent {
  const AddVoterEvent();
}
