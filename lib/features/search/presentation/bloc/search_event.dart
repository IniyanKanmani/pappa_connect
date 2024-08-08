part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class LoadedEvent extends SearchEvent {
  const LoadedEvent();
}

class AddressSearchEvent extends SearchEvent {
  const AddressSearchEvent({
    required this.value,
  });

  final String value;
}

class AddressSelectedEvent extends SearchEvent {
  const AddressSelectedEvent({
    required this.address,
  });

  final String address;
}

class ClearDataEvent extends SearchEvent {
  const ClearDataEvent();
}

class ModifyDataEvent extends SearchEvent {
  const ModifyDataEvent();
}

class SaveDataEvent extends SearchEvent {
  const SaveDataEvent();
}
