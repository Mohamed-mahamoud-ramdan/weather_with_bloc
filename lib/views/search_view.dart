import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_cubit.dart';

// ignore: must_be_immutable
class SearchView extends StatefulWidget {
  SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onFieldSubmitted: (value) async {
                final cubit = BlocProvider.of<WeathterCubit>(context);
                cubit.getWeather(value);
                Navigator.of(context).pop();
              },
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(bottom: 20, top: 10, left: 10),
                  helper: const Text("weather"),
                  hintText: "search",
                  labelText: "search for weather of any country",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
