import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/weathe_states.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_cubit.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/views/no_weather_body.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/views/weather_response.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Weather App"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return SearchView();
                },
              ));
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: BlocBuilder<WeathterCubit, WeatheStates>(
        builder: (context, state) {
          if (state is WeatherFailureState) {
            return NoWeatherBody(errorMessage: state.error);
          } else if (state is WeatherLoadedstate) {
            return const WeatherResponsePage();
          } else {
            return Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text("No data available yet "),
              ),
            );
          }
        },
      ),
    );
  }
}
