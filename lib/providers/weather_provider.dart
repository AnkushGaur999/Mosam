import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mosam/config/remote/network_client.dart';
import 'package:mosam/config/services/location_services.dart';
import 'package:mosam/models/current_weather.dart';

class WeatherProvider extends ChangeNotifier {
  final NetworkClient networkClient;
  final LocationService locationService;

  bool isLoading = false;
  bool isRequestError = false;
  String? errorMessage;

  CurrentWeather? currentWeather;

  final String accessKey = "c64a9ebfa7b7a2e87d82c75ac050fcb1";

  WeatherProvider({required this.networkClient, required this.locationService});

  Future<void> getCurrentWeatherData(BuildContext context) async {
    isLoading = true;
    isRequestError = false;
    errorMessage = null;

    notifyListeners();

    final Position? position = await locationService.getCurrentLocation();

    if (position == null) {
      isLoading = false;
      isRequestError = true;
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Location service disabled')));
      }
      errorMessage = 'Location service disabled';
      notifyListeners();
      return;
    }

    final latitude = position.latitude;
    final longitude = position.longitude;

    final url = "current";

    final Map<String, dynamic> queryParameters = {
      "access_key": accessKey,
      "query": "$latitude, $longitude",
    };

    final response = await networkClient.get(
      url,
      queryParameters: queryParameters,
    );

    if (response.statusCode == 200) {
      print("Response: ${response.data}");
      isRequestError = false;
      errorMessage = null;
      currentWeather = CurrentWeather.fromJson(response.data);

    }else{
      isRequestError = true;
      errorMessage = response.statusMessage;
    }
    isLoading = false;
    notifyListeners();
  }
}
