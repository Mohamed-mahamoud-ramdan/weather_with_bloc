import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/weathe_states.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/repositories/weather_repositoy.dart';

class WeathterCubit extends Cubit<WeatheStates> {
  WeathterCubit() : super(InitialState());
  late WeatherModel weatherData;

  getWeather(String value) async {
    emit(InitialState());
    try {
      WeatherModel weather =
          await WeatherServices().getForecastWeather(cityname: value);
      print("loeadinggggg");
      weatherData = weather;
      print(weather);
      emit(WeatherLoadedstate());
    } catch (e) {
      emit(WeatherFailureState(error: e.toString()));
    }
  }
}
