import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    _requestWeather();
  }

  Future<void> _requestWeather() async {
    final weatherProvider = Provider.of<WeatherProvider>(
      context,
      listen: false,
    );
    await weatherProvider.getCurrentWeatherData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<WeatherProvider>(
            builder: (context, WeatherProvider weatherProvider, child) {
              if (weatherProvider.isLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (weatherProvider.isRequestError) {
                return Center(
                  child: Text(
                    weatherProvider.errorMessage ?? "Something went wrong",
                  ),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MY LOCATION",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    Text(
                      weatherProvider.currentWeather!.location!.name!,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),

                    Row(
                      children: [
                        Text(
                          "${weatherProvider.currentWeather!.current!.temperature}\u00B0",
                          style: TextStyle(fontSize: 80, color: Colors.white),
                        ),
                      ],
                    ),

                    Text(
                      weatherProvider.currentWeather!.current!.weatherDescriptions![0],
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "H:36\u00B0",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "L:36\u00B0",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    Row(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
