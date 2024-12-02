import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_current_weather_cubit/get_current_weather_cubit.dart';

class SearchViewWidget extends StatelessWidget {
  const SearchViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: TextField(
          onSubmitted: (value) async {
            var getWeatherCubit =
                BlocProvider.of<GetCurrentWeatherCubit>(context);
            getWeatherCubit.getCurrentWeather(cityName: value);
            Navigator.of(context).pop();
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            labelText: 'Search',
            hintText: 'Enter city name',
            suffixIcon: Icon(Icons.search),
            suffixIconColor: Colors.black,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
          ),
        ),
      ),
    );
  }
}
