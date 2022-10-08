part of 'obhavo_bloc.dart';
@immutable
abstract class ObHavoEvent extends Equatable {
  const ObHavoEvent();
  @override
  List<Object> get props => [];
}

// class GetWeatherByLocation extends WeatherEvent {
//
// }

class GetObHavoShaharNomiEvent extends ObHavoEvent {
 final  String shaharNomi;
  GetObHavoShaharNomiEvent(this.shaharNomi);

  @override
  List<Object> get props => [shaharNomi];
}
