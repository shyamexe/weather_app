// ignore_for_file: public_member_api_docs, sort_constructors_first
class ForecastWeatherModel {
  Location? location;
  Current? current;
  Forecast? forecast;

  ForecastWeatherModel({this.location, this.current, this.forecast});

  ForecastWeatherModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
    forecast = json['forecast'] != null
        ? new Forecast.fromJson(json['forecast'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (forecast != null) {
      data['forecast'] = forecast!.toJson();
    }
    return data;
  }
}

class Location {
  String? name;
  String? region;
  String? country;
  String? lat;
  String? lon;
  String? tzId;
  String? localtimeEpoch;
  String? localtime;

  Location(
      {this.name,
      this.region,
      this.country,
      this.lat,
      this.lon,
      this.tzId,
      this.localtimeEpoch,
      this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'].toString();
    region = json['region'].toString();
    country = json['country'].toString();
    lat = json['lat'].toString();
    lon = json['lon'].toString();
    tzId = json['tz_id'].toString();
    localtimeEpoch = json['localtime_epoch'].toString();
    localtime = json['localtime'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['region'] = region;
    data['country'] = country;
    data['lat'] = lat;
    data['lon'] = lon;
    data['tz_id'] = tzId;
    data['localtime_epoch'] = localtimeEpoch;
    data['localtime'] = localtime;
    return data;
  }
}

class Current {
  String? lastUpdatedEpoch;
  String? lastUpdated;
  String? tempC;
  String? tempF;
  String? isDay;
  Condition? condition;
  String? windMph;
  String? windKph;
  String? windDegree;
  String? windDir;
  String? pressureMb;
  String? pressureIn;
  String? precipMm;
  String? precipIn;
  String? humidity;
  String? cloud;
  String? feelslikeC;
  String? feelslikeF;
  String? visKm;
  String? visMiles;
  String? uv;
  String? gustMph;
  String? gustKph;

  Current(
      {this.lastUpdatedEpoch,
      this.lastUpdated,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windMph,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.visKm,
      this.visMiles,
      this.uv,
      this.gustMph,
      this.gustKph});

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json['last_updated_epoch'].toString();
    lastUpdated = json['last_updated'].toString();
    tempC = json['temp_c'].toString();
    tempF = json['temp_f'].toString();
    isDay = json['is_day'].toString();
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
    windMph = json['wind_mph'].toString();
    windKph = json['wind_kph'].toString();
    windDegree = json['wind_degree'].toString();
    windDir = json['wind_dir'].toString();
    pressureMb = json['pressure_mb'].toString();
    pressureIn = json['pressure_in'].toString();
    precipMm = json['precip_mm'].toString();
    precipIn = json['precip_in'].toString();
    humidity = json['humidity'].toString();
    cloud = json['cloud'].toString();
    feelslikeC = json['feelslike_c'].toString();
    feelslikeF = json['feelslike_f'].toString();
    visKm = json['vis_km'].toString();
    visMiles = json['vis_miles'].toString();
    uv = json['uv'].toString();
    gustMph = json['gust_mph'].toString();
    gustKph = json['gust_kph'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_updated_epoch'] = lastUpdatedEpoch;
    data['last_updated'] = lastUpdated;
    data['temp_c'] = tempC;
    data['temp_f'] = tempF;
    data['is_day'] = isDay;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    data['wind_mph'] = windMph;
    data['wind_kph'] = windKph;
    data['wind_degree'] = windDegree;
    data['wind_dir'] = windDir;
    data['pressure_mb'] = pressureMb;
    data['pressure_in'] = pressureIn;
    data['precip_mm'] = precipMm;
    data['precip_in'] = precipIn;
    data['humidity'] = humidity;
    data['cloud'] = cloud;
    data['feelslike_c'] = feelslikeC;
    data['feelslike_f'] = feelslikeF;
    data['vis_km'] = visKm;
    data['vis_miles'] = visMiles;
    data['uv'] = uv;
    data['gust_mph'] = gustMph;
    data['gust_kph'] = gustKph;
    return data;
  }
}

class Condition {
  String? text;
  String? icon;
  String? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'].toString();
    icon = json['icon'].toString();
    code = json['code'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = text;
    data['icon'] = icon;
    data['code'] = code;
    return data;
  }
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(new Forecastday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (forecastday != null) {
      data['forecastday'] = forecastday!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() => 'Forecast(forecastday: $forecastday)';
}

class Forecastday {
  String? date;
  String? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecastday({this.date, this.dateEpoch, this.day, this.astro, this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'].toString();
    dateEpoch = json['date_epoch'].toString();
    day = json['day'] != null ? new Day.fromJson(json['day']) : null;
    astro = json['astro'] != null ? new Astro.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(new Hour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = date;
    data['date_epoch'] = dateEpoch;
    if (day != null) {
      data['day'] = day!.toJson();
    }
    if (astro != null) {
      data['astro'] = astro!.toJson();
    }
    if (hour != null) {
      data['hour'] = hour!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Forecastday(date: $date, dateEpoch: $dateEpoch, day: $day, astro: $astro, hour: $hour)';
  }
}

class Day {
  String? maxtempC;
  String? maxtempF;
  String? mStringempC;
  String? mStringempF;
  String? avgtempC;
  String? avgtempF;
  String? maxwindMph;
  String? maxwindKph;
  String? totalprecipMm;
  String? totalprecipIn;
  String? totalsnowCm;
  String? avgvisKm;
  String? avgvisMiles;
  String? avghumidity;
  String? dailyWillItRain;
  String? dailyChanceOfRain;
  String? dailyWillItSnow;
  String? dailyChanceOfSnow;
  Condition? condition;
  String? uv;

  Day(
      {this.maxtempC,
      this.maxtempF,
      this.mStringempC,
      this.mStringempF,
      this.avgtempC,
      this.avgtempF,
      this.maxwindMph,
      this.maxwindKph,
      this.totalprecipMm,
      this.totalprecipIn,
      this.totalsnowCm,
      this.avgvisKm,
      this.avgvisMiles,
      this.avghumidity,
      this.dailyWillItRain,
      this.dailyChanceOfRain,
      this.dailyWillItSnow,
      this.dailyChanceOfSnow,
      this.condition,
      this.uv});

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'].toString();
    maxtempF = json['maxtemp_f'].toString();
    mStringempC = json['mStringemp_c'].toString();
    mStringempF = json['mStringemp_f'].toString();
    avgtempC = json['avgtemp_c'].toString();
    avgtempF = json['avgtemp_f'].toString();
    maxwindMph = json['maxwind_mph'].toString();
    maxwindKph = json['maxwind_kph'].toString();
    totalprecipMm = json['totalprecip_mm'].toString();
    totalprecipIn = json['totalprecip_in'].toString();
    totalsnowCm = json['totalsnow_cm'].toString();
    avgvisKm = json['avgvis_km'].toString();
    avgvisMiles = json['avgvis_miles'].toString();
    avghumidity = json['avghumidity'].toString();
    dailyWillItRain = json['daily_will_it_rain'].toString();
    dailyChanceOfRain = json['daily_chance_of_rain'].toString();
    dailyWillItSnow = json['daily_will_it_snow'].toString();
    dailyChanceOfSnow = json['daily_chance_of_snow'].toString();
    condition = json['condition'].toString() != null
        ? new Condition.fromJson(json['condition'])
        : null;
    uv = json['uv'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maxtemp_c'] = maxtempC;
    data['maxtemp_f'] = maxtempF;
    data['mStringemp_c'] = mStringempC;
    data['mStringemp_f'] = mStringempF;
    data['avgtemp_c'] = avgtempC;
    data['avgtemp_f'] = avgtempF;
    data['maxwind_mph'] = maxwindMph;
    data['maxwind_kph'] = maxwindKph;
    data['totalprecip_mm'] = totalprecipMm;
    data['totalprecip_in'] = totalprecipIn;
    data['totalsnow_cm'] = totalsnowCm;
    data['avgvis_km'] = avgvisKm;
    data['avgvis_miles'] = avgvisMiles;
    data['avghumidity'] = avghumidity;
    data['daily_will_it_rain'] = dailyWillItRain;
    data['daily_chance_of_rain'] = dailyChanceOfRain;
    data['daily_will_it_snow'] = dailyWillItSnow;
    data['daily_chance_of_snow'] = dailyChanceOfSnow;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    data['uv'] = uv;
    return data;
  }
}

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  String? moonIllumination;
  String? isMoonUp;
  String? isSunUp;

  Astro(
      {this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moonPhase,
      this.moonIllumination,
      this.isMoonUp,
      this.isSunUp});

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'].toString();
    sunset = json['sunset'].toString();
    moonrise = json['moonrise'].toString();
    moonset = json['moonset'].toString();
    moonPhase = json['moon_phase'].toString();
    moonIllumination = json['moon_illumination'].toString();
    isMoonUp = json['is_moon_up'].toString();
    isSunUp = json['is_sun_up'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['moonrise'] = moonrise;
    data['moonset'] = moonset;
    data['moon_phase'] = moonPhase;
    data['moon_illumination'] = moonIllumination;
    data['is_moon_up'] = isMoonUp;
    data['is_sun_up'] = isSunUp;
    return data;
  }
}

class Hour {
  String? timeEpoch;
  String? time;
  String? tempC;
  String? tempF;
  String? isDay;
  Condition? condition;
  String? windMph;
  String? windKph;
  String? windDegree;
  String? windDir;
  String? pressureMb;
  String? pressureIn;
  String? precipMm;
  String? precipIn;
  String? humidity;
  String? cloud;
  String? feelslikeC;
  String? feelslikeF;
  String? windchillC;
  String? windchillF;
  String? heatindexC;
  String? heatindexF;
  String? dewpoStringC;
  String? dewpoStringF;
  String? willItRain;
  String? chanceOfRain;
  String? willItSnow;
  String? chanceOfSnow;
  String? visKm;
  String? visMiles;
  String? gustMph;
  String? gustKph;
  String? uv;

  Hour(
      {this.timeEpoch,
      this.time,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windMph,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.windchillC,
      this.windchillF,
      this.heatindexC,
      this.heatindexF,
      this.dewpoStringC,
      this.dewpoStringF,
      this.willItRain,
      this.chanceOfRain,
      this.willItSnow,
      this.chanceOfSnow,
      this.visKm,
      this.visMiles,
      this.gustMph,
      this.gustKph,
      this.uv});

  Hour.fromJson(Map<String, dynamic> json) {
    timeEpoch = json['time_epoch'].toString();
    time = json['time'].toString();
    tempC = json['temp_c'].toString();
    tempF = json['temp_f'].toString();
    isDay = json['is_day'].toString();
    condition = json['condition'].toString() != null
        ? new Condition.fromJson(json['condition'])
        : null;
    windMph = json['wind_mph'].toString();
    windKph = json['wind_kph'].toString();
    windDegree = json['wind_degree'].toString();
    windDir = json['wind_dir'].toString();
    pressureMb = json['pressure_mb'].toString();
    pressureIn = json['pressure_in'].toString();
    precipMm = json['precip_mm'].toString();
    precipIn = json['precip_in'].toString();
    humidity = json['humidity'].toString();
    cloud = json['cloud'].toString();
    feelslikeC = json['feelslike_c'].toString();
    feelslikeF = json['feelslike_f'].toString();
    windchillC = json['windchill_c'].toString();
    windchillF = json['windchill_f'].toString();
    heatindexC = json['heatindex_c'].toString();
    heatindexF = json['heatindex_f'].toString();
    dewpoStringC = json['dewpoString_c'].toString();
    dewpoStringF = json['dewpoString_f'].toString();
    willItRain = json['will_it_rain'].toString();
    chanceOfRain = json['chance_of_rain'].toString();
    willItSnow = json['will_it_snow'].toString();
    chanceOfSnow = json['chance_of_snow'].toString();
    visKm = json['vis_km'].toString();
    visMiles = json['vis_miles'].toString();
    gustMph = json['gust_mph'].toString();
    gustKph = json['gust_kph'].toString();
    uv = json['uv'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time_epoch'] = timeEpoch;
    data['time'] = time;
    data['temp_c'] = tempC;
    data['temp_f'] = tempF;
    data['is_day'] = isDay;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    data['wind_mph'] = windMph;
    data['wind_kph'] = windKph;
    data['wind_degree'] = windDegree;
    data['wind_dir'] = windDir;
    data['pressure_mb'] = pressureMb;
    data['pressure_in'] = pressureIn;
    data['precip_mm'] = precipMm;
    data['precip_in'] = precipIn;
    data['humidity'] = humidity;
    data['cloud'] = cloud;
    data['feelslike_c'] = feelslikeC;
    data['feelslike_f'] = feelslikeF;
    data['windchill_c'] = windchillC;
    data['windchill_f'] = windchillF;
    data['heatindex_c'] = heatindexC;
    data['heatindex_f'] = heatindexF;
    data['dewpoString_c'] = dewpoStringC;
    data['dewpoString_f'] = dewpoStringF;
    data['will_it_rain'] = willItRain;
    data['chance_of_rain'] = chanceOfRain;
    data['will_it_snow'] = willItSnow;
    data['chance_of_snow'] = chanceOfSnow;
    data['vis_km'] = visKm;
    data['vis_miles'] = visMiles;
    data['gust_mph'] = gustMph;
    data['gust_kph'] = gustKph;
    data['uv'] = uv;
    return data;
  }
}
