part of 'data_entry_bloc.dart';

abstract class DataEntryState extends Equatable {
  const DataEntryState({this.dataEntryData});

  final Map<String, dynamic>? dataEntryData;

  @override
  List<Object> get props => [
        Random().nextDouble(),
      ];
}

class DataEntryActionState extends DataEntryState {}

class LoadingState extends DataEntryState {}

class LoadedState extends DataEntryState {
  const LoadedState({super.dataEntryData});
}

class ErrorState extends DataEntryActionState {}
