part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadedEvent extends HomeEvent {
  const LoadedEvent();
}

class ViewChangeEvent extends HomeEvent {
  const ViewChangeEvent({
    required this.index,
    required this.homeData,
  });

  final int index;
  final Map<String, dynamic> homeData;
}
