class WeatheStates {}

class InitialState extends WeatheStates {}

class WeatherLoadedstate extends WeatheStates {
  WeatherLoadedstate();
}

class WeatherFailureState extends WeatheStates {
  final String error;

  WeatherFailureState({required this.error});
}
