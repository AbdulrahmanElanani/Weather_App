import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_current_weather_cubit/get_current_states.dart';
import 'package:weather_app/cubit/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCurrentWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetCurrentWeatherCubit, WeatherState>(
            builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: getTheme(
                    condition: BlocProvider.of<GetCurrentWeatherCubit>(context)
                        .weatherModel
                        ?.weatherStatues),
              ),
              colorSchemeSeed: getTheme(
                  condition: BlocProvider.of<GetCurrentWeatherCubit>(context)
                      .weatherModel
                      ?.weatherStatues),
              useMaterial3: true,
            ),
            home: const HomeView(),
          );
        }),
      ),
    );
  }
}

MaterialColor getTheme({required String? condition}) {
  if (condition == null) {
    return Colors.blue;
  } else {
    switch (condition) {
      case 'Sunny':
        return Colors.orange;
      case 'Partly cloudy':
        return Colors.yellow;
      case 'Cloudy':
      case 'Overcast':
      case 'Blowing snow':
      case 'Patchy light snow':
      case 'Light snow':
      case 'Patchy moderate snow':
      case 'Moderate snow':
      case 'Patchy heavy snow':
      case 'Heavy snow':
      case 'Light snow showers':
      case 'Moderate or heavy snow showers':
      case 'Moderate or heavy snow with thunder':
      case 'Patchy snow possible':
        return Colors.grey;
      case 'Mist':
      case 'Freezing fog':
      case 'Patchy freezing drizzle possible':
      case 'Light drizzle':
      case 'Freezing drizzle':
      case 'Heavy freezing drizzle':
      case 'Light freezing rain':
      case 'Moderate or heavy freezing rain':
      case 'Patchy light rain':
      case 'Light rain':
      case 'Moderate rain at times':
      case 'Moderate rain':
      case 'Heavy rain at times':
      case 'Heavy rain':
      case 'Light sleet':
      case 'Moderate or heavy sleet':
      case 'Light sleet showers':
      case 'Moderate or heavy sleet showers':
      case 'Light showers of ice pellets':
      case 'Patchy light rain with thunder':
      case 'Patchy light snow with thunder':
        return Colors.blue;
      case 'Thundery outbreaks possible':
      case 'Moderate or heavy rain with thunder':
        return Colors.purple;
      case 'Fog':
        return Colors.cyan;
      case 'Blizzard':
      case 'Heavy snow':
        return Colors.blueGrey;
      case 'Ice pellets':
      case 'Light rain shower':
      case 'Moderate or heavy rain shower':
      case 'Torrential rain shower':
      case 'Moderate or heavy showers of ice pellets':
      case 'Patchy light snow with thunder':
        return Colors.blueGrey;
      case 'Patchy sleet possible':
      case 'Moderate or heavy sleet':
        return Colors.blue;
      case 'Moderate or heavy sleet showers':
        return Colors.blue;
      case 'Moderate or heavy freezing rain':
        return Colors.blue;
      case 'Light snow showers':
      case 'Moderate or heavy snow showers':
        return Colors.grey;
      case 'Patchy rain possible':
        return Colors.lightBlue;
      case 'Patchy light drizzle':
        return Colors.blueGrey;
      case 'Heavy rain':
        return Colors.blue;
      case 'Moderate rain at times':
        return Colors.blueGrey;
      case 'Moderate or heavy snow with thunder':
        return Colors.blueGrey;
      case 'Patchy light rain with thunder':
        return Colors.deepPurple;
      default:
        return Colors.blue;
    }
  }
}
