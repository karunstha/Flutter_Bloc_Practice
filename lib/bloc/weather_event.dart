part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent(String);
}

class GetWeather extends WeatherEvent{
  final String _cityName;
  GetWeather(this._cityName):super(_cityName);
  @override
  List<Object> get props => null;
  
}