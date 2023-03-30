import 'package:weather_app/src/shared/http/api_provider.dart';

class WeatherRepository {
  getCurrentWeather(
      {required String latitude, required String longitude}) async {
    final response = await APiProvider().get(
        '/v1/current.json?key={API_KEY}&q={$latitude,$longitude}&aqi=no',
        query: {
          
        });
  }
}
