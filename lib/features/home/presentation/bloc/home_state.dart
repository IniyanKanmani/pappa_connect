part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState({this.homeData});

  final Map<String, dynamic>? homeData;

  @override
  List<Object> get props => [
        Random().nextDouble(),
      ];
}

class HomeActionState extends HomeState {}

class LoadingState extends HomeState {}

class LoadedState extends HomeState {
  const LoadedState({super.homeData});
}

class ErrorState extends HomeActionState {}
