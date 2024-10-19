import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_api_app/networking/api_endpoints.dart';

import '../models/weather_model.dart';

final cityForecastProvider = FutureProvider.autoDispose.family<WeatherModel, String>(
  (ref, cityName) => ApiEndpoints.getWeatherByCityName(
    cityName: cityName,
  ),
);