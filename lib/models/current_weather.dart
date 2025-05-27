class CurrentWeather {
  Request? request;
  Location? location;
  Current? current;

  CurrentWeather({this.request, this.location, this.current});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    request = json['request'] != null
        ? Request.fromJson(json['request'])
        : null;
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    current = json['current'] != null
        ? Current.fromJson(json['current'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (request != null) {
      map['request'] = request?.toJson();
    }
    if (location != null) {
      map['location'] = location?.toJson();
    }
    if (current != null) {
      map['current'] = current?.toJson();
    }
    return map;
  }
}

class Current {
  Current({
    this.observationTime,
    this.temperature,
    this.weatherCode,
    this.weatherIcons,
    this.weatherDescriptions,
    this.astro,
    this.airQuality,
    this.windSpeed,
    this.windDegree,
    this.windDir,
    this.pressure,
    this.precip,
    this.humidity,
    this.cloudcover,
    this.feelslike,
    this.uvIndex,
    this.visibility,
    this.isDay,
  });

  Current.fromJson(dynamic json) {
    observationTime = json['observation_time'];
    temperature = json['temperature'];
    weatherCode = json['weather_code'];
    weatherIcons = json['weather_icons'] != null
        ? json['weather_icons'].cast<String>()
        : [];
    weatherDescriptions = json['weather_descriptions'] != null
        ? json['weather_descriptions'].cast<String>()
        : [];
    astro = json['astro'] != null ? Astro.fromJson(json['astro']) : null;
    airQuality = json['air_quality'] != null
        ? AirQuality.fromJson(json['air_quality'])
        : null;
    windSpeed = json['wind_speed'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressure = json['pressure'];
    precip = json['precip'];
    humidity = json['humidity'];
    cloudcover = json['cloudcover'];
    feelslike = json['feelslike'];
    uvIndex = json['uv_index'];
    visibility = json['visibility'];
    isDay = json['is_day'];
  }

  String? observationTime;
  int? temperature;
  int? weatherCode;
  List<String>? weatherIcons;
  List<String>? weatherDescriptions;
  Astro? astro;
  AirQuality? airQuality;
  int? windSpeed;
  int? windDegree;
  String? windDir;
  int? pressure;
  int? precip;
  int? humidity;
  int? cloudcover;
  int? feelslike;
  int? uvIndex;
  int? visibility;
  String? isDay;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['observation_time'] = observationTime;
    map['temperature'] = temperature;
    map['weather_code'] = weatherCode;
    map['weather_icons'] = weatherIcons;
    map['weather_descriptions'] = weatherDescriptions;
    if (astro != null) {
      map['astro'] = astro?.toJson();
    }
    if (airQuality != null) {
      map['air_quality'] = airQuality?.toJson();
    }
    map['wind_speed'] = windSpeed;
    map['wind_degree'] = windDegree;
    map['wind_dir'] = windDir;
    map['pressure'] = pressure;
    map['precip'] = precip;
    map['humidity'] = humidity;
    map['cloudcover'] = cloudcover;
    map['feelslike'] = feelslike;
    map['uv_index'] = uvIndex;
    map['visibility'] = visibility;
    map['is_day'] = isDay;
    return map;
  }
}

class AirQuality {
  AirQuality({
    this.co,
    this.no2,
    this.o3,
    this.so2,
    this.pm25,
    this.pm10,
    this.usepaindex,
    this.gbdefraindex,
  });

  AirQuality.fromJson(dynamic json) {
    co = json['co'];
    no2 = json['no2'];
    o3 = json['o3'];
    so2 = json['so2'];
    pm25 = json['pm2_5'];
    pm10 = json['pm10'];
    usepaindex = json['us-epa-index'];
    gbdefraindex = json['gb-defra-index'];
  }

  String? co;
  String? no2;
  String? o3;
  String? so2;
  String? pm25;
  String? pm10;
  String? usepaindex;
  String? gbdefraindex;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['co'] = co;
    map['no2'] = no2;
    map['o3'] = o3;
    map['so2'] = so2;
    map['pm2_5'] = pm25;
    map['pm10'] = pm10;
    map['us-epa-index'] = usepaindex;
    map['gb-defra-index'] = gbdefraindex;
    return map;
  }
}

class Astro {
  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
  });

  Astro.fromJson(dynamic json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
  }

  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  int? moonIllumination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    map['moonrise'] = moonrise;
    map['moonset'] = moonset;
    map['moon_phase'] = moonPhase;
    map['moon_illumination'] = moonIllumination;
    return map;
  }
}

class Location {
  Location({
    this.name,
    this.country,
    this.region,
    this.lat,
    this.lon,
    this.timezoneId,
    this.localtime,
    this.localtimeEpoch,
    this.utcOffset,
  });

  Location.fromJson(dynamic json) {
    name = json['name'];
    country = json['country'];
    region = json['region'];
    lat = json['lat'];
    lon = json['lon'];
    timezoneId = json['timezone_id'];
    localtime = json['localtime'];
    localtimeEpoch = json['localtime_epoch'];
    utcOffset = json['utc_offset'];
  }

  String? name;
  String? country;
  String? region;
  String? lat;
  String? lon;
  String? timezoneId;
  String? localtime;
  int? localtimeEpoch;
  String? utcOffset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['country'] = country;
    map['region'] = region;
    map['lat'] = lat;
    map['lon'] = lon;
    map['timezone_id'] = timezoneId;
    map['localtime'] = localtime;
    map['localtime_epoch'] = localtimeEpoch;
    map['utc_offset'] = utcOffset;
    return map;
  }
}

class Request {
  Request({this.type, this.query, this.language, this.unit});

  Request.fromJson(dynamic json) {
    type = json['type'];
    query = json['query'];
    language = json['language'];
    unit = json['unit'];
  }

  String? type;
  String? query;
  String? language;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['query'] = query;
    map['language'] = language;
    map['unit'] = unit;
    return map;
  }
}
