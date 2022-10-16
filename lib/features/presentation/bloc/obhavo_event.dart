part of 'obhavo_bloc.dart';

@immutable
abstract class ObHavoEvent extends Equatable {
  const ObHavoEvent();

  @override
  List<Object> get props => [];
}

//event 1
class GetObHavoShaharNomiEvent extends ObHavoEvent {
  final String shaharNomi;

  GetObHavoShaharNomiEvent(this.shaharNomi);

  @override
  List<Object> get props => [shaharNomi];
}

// event 2
class GetObHavoLocationEvent extends ObHavoEvent {
  @override
  List<Object> get props => [];
}
