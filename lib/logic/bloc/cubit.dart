import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/constants.dart';
import 'package:untitled2/logic/api/api.dart';
import 'package:untitled2/logic/bloc/states.dart';
import 'package:untitled2/models/model.dart';

class cubit extends Cubit<States> {
  cubit() : super(InitialState());

  static cubit get(context) => BlocProvider.of(context);
  WeatherModel? weatherModel;
  late String cityName;

  void getData() async {
    emit(GetDataLoadingState());
    await API.getWeatherDate(cityName: cityName).then((value) {
      weatherModel = WeatherModel.fromJson(jsonDecode(value.body));
      changeTheme(weatherModel!.weatherStateName);
      emit(GetDataSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(GetDataFailedState());
    });
  }

  void changeTheme(String weatherStateName) {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy') {
      primaryImage = "assets/images/clear.png" ;
      primaryColor = Colors.orange;
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow') {
      primaryImage = "assets/images/snow.png" ;
      primaryColor = Colors.blue;
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog') {
      primaryImage = "assets/images/cloudy.png" ;
      primaryColor = Colors.blueGrey;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      primaryImage = "assets/images/rainy.png" ;
      primaryColor = Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      primaryImage = "assets/images/thunderstorm.png" ;
      primaryColor = Colors.deepPurple;
    } else {
      primaryImage = "assets/images/clear.png" ;
      primaryColor = Colors.orange;
    }
  }
}
