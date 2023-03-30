import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/src/weather/bloc/current_weather_cubit.dart';
import 'package:weather_app/src/weather/bloc/location_cubit.dart';

import '../settings/settings_view.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class Home extends StatefulWidget {
  static const routeName = '/';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
            body: BlocConsumer<LocationCubit, LocationState>(
          listener: (context, loc) {
            if (loc is LocationLoaded) {
              context.read<CurrentWeatherCubit>().loadWeather(
                    latitude: loc.locationData.latitude.toString(),
                    longitude: loc.locationData.longitude.toString(),
                  );
            }
          },
          builder: (context, loc) {
            if (loc is LocationLoaded) {
              return BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
                builder: (context, current) {
                  if (current is CurrentWeatherLoaded) {
                    return Column(
                      children: [
                        SizedBox(height: 20,),
                        Text(
                          '${current.data.location?.name.toString()},${current.data.location?.region.toString()}',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          '${current.data.current?.tempC.toString() ?? ''} ℃',
                          style: TextStyle(
                            fontSize: 72,
                          ),
                        ),
                        SizedBox(height: 20,),

                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.network(
                                'http:${current.data.current?.condition?.icon ?? ''}',
                                fit: BoxFit.contain,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                  ' ${current.data.current?.condition?.text ?? ''}.')
                            ],
                          ),
                        ),

                      ],
                    );
                  } else {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                },
              );
            } else if (loc is LocationLoading) {
              return const Center(
                child: CupertinoActivityIndicator(animating: true),
              );
            } else {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 200,
                        child: Lottie.network(
                            'https://assets2.lottiefiles.com/packages/lf20_lgpzpyna.json')),
                    const SizedBox(
                      height: 30,
                    ),
                    const Center(
                      child: Text(
                        'Enable your location',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                      child: Text(
                        'Our app requires access to your location in order to fetch weather data. Without this information, we will be unable to provide you with accurate weather updates.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    CupertinoButton.filled(
                      child: const Text('Allow'),
                      onPressed: () {
                        context.read<LocationCubit>().initLoc();
                      },
                    )
                  ],
                ),
              );
            }
          },
        )),
      ),
    );
  }
}
