import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'e9a947aae7dd4f3aaa983351243011';
  final String endPoint = 'forecast.json';
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/$endPoint?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJosn(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'there was an error, try later';
      throw Exception(errMessage);
    } catch (e) {
      throw Exception('there was an error, try later');
    }
  }
}
