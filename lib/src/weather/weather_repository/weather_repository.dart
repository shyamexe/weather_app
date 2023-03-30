import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/src/shared/http/api_provider.dart';
import 'package:weather_app/src/weather/model/current_weather.dart';

class WeatherRepository {
  getCurrentWeather(
      {required String latitude, required String longitude}) async {
        print('$latitude-$longitude');
    Response response = await APiProvider().get('/v1/current.json', query: {
      'key': dotenv.env['API_KEY'],
      'q': '$latitude,$longitude',
      'aqi': 'no'
    });
    print(response);
    return CurrentWeatherModel.fromJson(response.data);
  }
}
