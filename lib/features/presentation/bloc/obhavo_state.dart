part of 'obhavo_bloc.dart';


@immutable
abstract class ObHavoState extends Equatable {
  const ObHavoState();
}

class InitialObHavo extends ObHavoState {
  @override
  List<Object> get props => [];
}

class LoadingObHavo extends ObHavoState {
  @override
  List<Object> get props => [];

}

class LoadedObHavo extends ObHavoState {
  final ObHavoEntity obhavo;

  LoadedObHavo({required this.obhavo});

  @override
  List<Object> get props => [obhavo];

}

class ErrorObHavo extends ObHavoState {
  final String errorXabar;

  ErrorObHavo({required this.errorXabar});

  @override
  List<Object> get props => [errorXabar];
}