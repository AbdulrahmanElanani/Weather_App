class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherStatues;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStatues});

  factory WeatherModel.fromJosn(josn) {
    return WeatherModel(
        cityName: josn['location']['name'],
        date: DateTime.parse(josn['current']['last_updated']),
        image: josn['forecast']['forecastday'][0]['day']['condition']['icon'],
        temp: josn['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: josn['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: josn['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherStatues: josn['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }
}
