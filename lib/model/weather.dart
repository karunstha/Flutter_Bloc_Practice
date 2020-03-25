import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Weather extends Equatable{

  final String cityName;
  final double temperature;

  Weather({this.cityName, this.temperature});

  @override
  // TODO: implement props
  List<Object> get props => [cityName, temperature];

}