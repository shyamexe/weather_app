// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/weather/model/current_weather.dart';
import 'package:weather_app/src/weather/model/forecast_weather.dart';
import 'package:weather_app/src/weather/weather_repository/weather_repository.dart';

class CurrentWeatherState extends Equatable {
  const CurrentWeatherState();

  @override
  List<Object> get props => [];
}

class CurrentWeatherInitial extends CurrentWeatherState {}

class CurrentWeatherLoading extends CurrentWeatherState {}

class CurrentWeatherLoaded extends CurrentWeatherState {
  final CurrentWeatherModel? data;
  final ForecastWeatherModel? forecaste;
  const CurrentWeatherLoaded({required this.data, required this.forecaste});

  @override
  List<Object> get props => [];
}

class CurrentWeatherFailure extends CurrentWeatherState {
  final String error;
  const CurrentWeatherFailure({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  CurrentWeatherCubit()
      : super(
          CurrentWeatherInitial(),
        );

  loadWeather({required String latitude, required String longitude}) async {
    try {
      emit(CurrentWeatherLoading());

      final CurrentWeatherModel? data =
          await WeatherRepository().getCurrentWeather(
        latitude: latitude,
        longitude: longitude,
      );
      final ForecastWeatherModel? forecaste =
          await WeatherRepository().getForecastWeather(
        latitude: latitude,
        longitude: longitude,
      );
      

      emit(
        CurrentWeatherLoaded(data: data, forecaste: forecaste),
      );
    } catch (e) {
      emit(
        CurrentWeatherFailure(
          error: e.toString(),
        ),
      );
    }
  }
}
