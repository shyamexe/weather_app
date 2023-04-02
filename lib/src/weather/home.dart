import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/src/shared/constants/lottie_url.dart';
import 'package:weather_app/src/shared/helper/text_helper.dart';
import 'package:weather_app/src/weather/bloc/current_weather_cubit.dart';
import 'package:weather_app/src/weather/bloc/location_cubit.dart';

class Home extends StatefulWidget {
  static const routeName = '/';

  const Home({super.key});

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
                    return CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                          leading: Image.network(
                            'http:${current.data?.current?.condition?.icon ?? ''}',
                            fit: BoxFit.contain,
                          ),
                          elevation: 0,
                          expandedHeight: 410,
                          snap: true,
                          stretch: true,
                          floating: true,
                          pinned: true,
                          flexibleSpace: FlexibleSpaceBar(
                            title: Text(
                                current.data?.current?.condition?.text ?? ""),
                            collapseMode: CollapseMode.parallax,
                            stretchModes: const [
                              StretchMode.blurBackground,
                              StretchMode.fadeTitle
                            ],
                            background: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${current.data?.location?.name.toString()},${current.data?.location?.region.toString()}',
                                  style: const TextStyle(
                                    fontSize: 40,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 250,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        height: 250,
                                        child: Lottie.network(
                                            lottieUrls
                                                .where((element) =>
                                                    element['code'] ==
                                                    current.data?.current
                                                        ?.condition?.code
                                                        .toString())
                                                .first['url'],
                                            fit: BoxFit.contain),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color:
                                                Colors.black.withOpacity(.3)),
                                        child: Text(
                                          '${current.data?.current?.tempC.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "") ?? ''}℃',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 60),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    children: List.generate(
                                      current.forecaste?.forecast?.forecastday
                                              ?.length ??
                                          0,
                                      (index) => Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Card(
                                          child: Column(
                                            children: [
                                              ListTile(
                                                leading: Image.network(
                                                    'http:${current.forecaste?.forecast?.forecastday?[index].day?.condition?.icon ?? ''}'),
                                                title: Text(TextHelpers()
                                                    .dateformatter(current
                                                            .forecaste
                                                            ?.forecast
                                                            ?.forecastday?[
                                                                index]
                                                            .date
                                                            .toString() ??
                                                        '')),
                                                subtitle: Text(current
                                                        .forecaste
                                                        ?.forecast
                                                        ?.forecastday?[index]
                                                        .day
                                                        ?.condition
                                                        ?.text ??
                                                    ''),
                                                trailing: Text(
                                                  "${current.forecaste?.forecast?.forecastday?[index].day?.avgtempC.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "")}℃",
                                                  style: TextStyle(
                                                    fontSize: 32
                                                  ),
                                                ),
                                              ),
                                              SingleChildScrollView(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  children: List.generate(
                                                      current
                                                              .forecaste
                                                              ?.forecast
                                                              ?.forecastday?[
                                                                  index]
                                                              .hour
                                                              ?.length ??
                                                          0,
                                                      (j) => Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(TextHelpers().dayTime(current
                                                                        .forecaste
                                                                        ?.forecast
                                                                        ?.forecastday?[
                                                                            index]
                                                                        .hour?[
                                                                            j]
                                                                        .time ??
                                                                    '')),
                                                                Image.network(
                                                                    'http:${current.forecaste?.forecast?.forecastday?[index].hour?[j].condition?.icon ?? ''}'),
                                                                Text(current
                                                                        .forecaste
                                                                        ?.forecast
                                                                        ?.forecastday?[
                                                                            index]
                                                                        .hour?[
                                                                            j]
                                                                        .condition
                                                                        ?.text ??
                                                                    '')
                                                              ],
                                                            ),
                                                          )),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                ],
                              );
                            },
                            childCount: 1,
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
