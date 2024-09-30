import 'package:dio/dio.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherServices {
  late Dio dio;

  WeatherServices() {
    dio = Dio();
  }

  Future<WeatherModel> getForecastWeather({required String cityname}) async {
    try {
      Response response = await dio.get(
          "https://api.weatherapi.com/v1/forecast.json?key=$API_KEY&q=$cityname&aqi=no");
      print(response.data);
      return WeatherModel.formJson(response.data);
    } catch (e) {
      print("e.toString()${e.toString()}");
      throw Exception(e.toString());
    }
  }
}
