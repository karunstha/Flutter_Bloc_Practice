part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState{
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}

class WeatherLoaded extends WeatherState{

  final Weather weather;

  WeatherLoaded(this.weather);

  @override
  // TODO: implement props
  List<Object> get props => [weather];

}