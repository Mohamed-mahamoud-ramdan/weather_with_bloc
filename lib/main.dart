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
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.yellow),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
