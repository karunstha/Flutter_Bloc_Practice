import 'package:bloc_test_weather/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/weather.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final weatherBloc = WeatherBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Weather Nepal"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder(
          bloc: weatherBloc,
          builder: (BuildContext context, WeatherState state) {
            if (state is WeatherInitial) {
              return buildInitial();
            } else if (state is WeatherLoading) {
              return buildLoading();
            } else if (state is WeatherLoaded) {
              return buildColumn(state.weather);
            }
          },
        ),
      ),
    );
  }

  Column buildInitial() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text(
          "Hello Welcome",
          style: new TextStyle(fontSize: 34.0),
        ),
        new SizedBox(
          height: 20,
        ),
        new RaisedButton(
            child: new Text("Get Temperature"),
            onPressed: () => {weatherBloc.add(GetWeather("Kathmandu"))}),
      ],
    );
  }

  Column buildLoading() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text(
          "Loading...",
          style: new TextStyle(fontSize: 34.0),
        ),
      ],
    );
  }

  Column buildColumn(Weather weather) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text(
          "${weather.temperature.toStringAsFixed(1)} C",
          style: new TextStyle(fontSize: 50.0),
        ),
        new SizedBox(
          height: 20,
        ),
        new RaisedButton(
            child: new Text("Get Temperature"),
            onPressed: () => {weatherBloc.add(GetWeather("Kathmandu"))}),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    weatherBloc.close();
  }
}
