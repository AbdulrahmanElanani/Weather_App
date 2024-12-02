import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_current_weather_cubit/get_current_states.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../services/weather_service.dart';

class GetCurrentWeatherCubit extends Cubit<WeatherState> {
  GetCurrentWeatherCubit() : super(NoWeatherState());
  WeatherModel? weatherModel;
  getCurrentWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService(dio: Dio())
          .getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherLoadedFlierState(errMessage: e.toString()));
    }
  }
}
