import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_weather/model/weather.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeather) {
      yield WeatherLoading();
      final weather = await _fetchWeatherFromApi(event._cityName);
      yield WeatherLoaded(weather);
    }
  }
}

Future<Weather> _fetchWeatherFromApi(String cityName) {
  return Future.delayed(Duration(seconds: 1), () {
    return Weather(
        cityName: cityName,
        temperature: 20 + Random().nextInt(15) + Random().nextDouble());
  });
}
