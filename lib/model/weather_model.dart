class WeatherModel {
  final String cityName;
  final String date;
  final String? image;
  final double temp;
  final double maTemp;
  final double minTemp;
  final String weatherCondition;
  final String contounty;

  WeatherModel({
    required this.contounty,
    required this.cityName,
    required this.date,
    this.image,
    required this.temp,
    required this.maTemp,
    required this.minTemp,
    required this.weatherCondition,
  });

  factory WeatherModel.formJson(Map<String, dynamic> json) {
    return WeatherModel(
      contounty: json["location"]["country"],
      cityName: json["location"]["name"],
      date: json["forecast"]["forecastday"][0]["date"],
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
    );
  }
}
