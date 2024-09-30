import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherResponsePage extends StatelessWidget {
  const WeatherResponsePage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData =
        BlocProvider.of<WeathterCubit>(context).weatherData;
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              getWeatherColor(BlocProvider.of<WeathterCubit>(context)
                  .weatherData
                  ?.weatherCondition)[800]!,
              getWeatherColor(BlocProvider.of<WeathterCubit>(context)
                  .weatherData
                  ?.weatherCondition)[200]!,
            ])),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  "${weatherData!.cityName}.",
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 40),
                ),
                Text(
                  "${weatherData!.contounty}.",
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 30),
                ),
                Text(
                  "updated at  ${weatherData.date}",
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 20),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      weatherData.image!,
                      width: 150,
                      height: 160,
                    ),
                    Text(
                      "${weatherData.temp}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Column(
                      children: [
                        Text(
                          "max temp : ${weatherData.maTemp}",
                          style: const TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20),
                        ),
                        Text(
                          "min temp : ${weatherData.minTemp}",
                          style: const TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "${weatherData.weatherCondition} ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
