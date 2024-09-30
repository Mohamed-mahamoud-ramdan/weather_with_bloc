import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_cubit.dart';
import 'package:weather_app/views/home..dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeathterCubit(),
      child: Builder(builder: (context) {
        return MaterialApp(
          theme: ThemeData(
              primarySwatch: getWeatherColor(
                  BlocProvider.of<WeathterCubit>(context)
                      .weatherData
                      ?.weatherCondition)),
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      }),
    );
  }
}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) {
    return Colors.cyan;
  }
  switch (condition) {
    case "Sunny":
      return Colors.yellow;
    case "Partly cloudy":
      return Colors.lightBlue;
    case "Cloudy":
      return Colors.grey;
    case "Overcast":
      return Colors.blueGrey;
    case "Mist":
      return Colors.blueGrey;
    case "Patchy rain possible":
      return Colors.green;
    case "Patchy snow possible":
      return Colors.blueGrey;
    case "Patchy sleet possible":
      return Colors.cyan;
    case "Patchy freezing drizzle possible":
      return Colors.lightBlue;
    case "Thundery outbreaks possible":
    case "Blowing snow":
    case "Blizzard":
    case "Fog":
    case "Freezing fog":
    case "Patchy light drizzle":
    case "Light drizzle":
      return Colors.blue;
    case "Heavy freezing drizzle":
    case "Patchy light rain":
      return Colors.lightGreen;
    case "Light rain":
      return Colors.green;
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Light freezing rain":
      return Colors.lightBlue;

    case "Light sleet":
      return Colors.cyan;
    case "Moderate or heavy sleet":
      return Colors.teal;
    case "Patchy light snow":
    case "Light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Light rain shower":
      return Colors.lightGreen;
    case "Moderate or heavy rain shower":
      return Colors.green;
    case "Torrential rain shower":
    case "Light sleet showers":
      return Colors.cyan;
    case "Moderate or heavy sleet showers":
      return Colors.teal;
    case "Light snow showers":
    case "Moderate or heavy snow showers":
    case "Light showers of ice pellets":
      return Colors.lightBlue;
    case "Moderate or heavy showers of ice pellets":
      return Colors.teal;
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.deepOrange;

    default:
      return Colors.grey; // Default color for unknown conditions
  }
}
