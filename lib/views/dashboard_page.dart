import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mosam/config/utils/time_utils.dart';
import 'package:mosam/views/widgets/hourly_forecast_card.dart';
import 'package:mosam/views/widgets/weekly_forecast_card.dart';
import '../config/utils/weather_temprary_data.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchWeatherData(); // Fetch weather data on widget initialization
    });
  }

  /// Fetches current weather data using the WeatherProvider
  Future<void> _fetchWeatherData() async {
    final weatherProvider = Provider.of<WeatherProvider>(
      context,
      listen: false,
    );
    await weatherProvider.getCurrentWeatherData(context);
  }

  @override
  Widget build(BuildContext context) {
    final forecast = forecastData['forecast'] as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: Colors.blueAccent.shade700,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer<WeatherProvider>(
            builder: (context, provider, _) {
              // Show loading indicator
              if (provider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              // Show error message
              else if (provider.isRequestError) {
                return Center(
                  child: Text(provider.errorMessage ?? "Something went wrong"),
                );
              }

              final current = provider.currentWeather!.current!;
              final location = provider.currentWeather!.location!;

              // Build the main UI when data is available
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLocationHeader(
                      location.name!,
                      location.localtimeEpoch!,
                    ),
                    _buildCurrentWeather(current),
                    const SizedBox(height: 20),
                    _buildInfoGrid(provider),
                    const SizedBox(height: 16),
                    _buildSectionTitle("Hourly Forecast"),
                    const SizedBox(height: 10),
                    HourlyForecastCard(hourlyData: hourlyForecast),
                    const SizedBox(height: 16),
                    _buildSectionTitle("7 Days Forecast"),
                    const SizedBox(height: 10),
                    _buildWeeklyForecastList(forecast),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Builds location name and local time UI
  Widget _buildLocationHeader(String cityName, int epoch) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              cityName,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.location_on_rounded, color: Colors.white),
          ],
        ),
        Text(
          getFormatedTime(epoch),
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }

  /// Builds current temperature, weather description and icon UI
  Widget _buildCurrentWeather(dynamic current) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Weather Temperature and Description
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${current.temperature}\u00B0C",
                style: const TextStyle(fontSize: 60, color: Colors.white),
              ),
              Text(
                current.weatherDescriptions![0],
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
          // Weather Icon
          Image.network(
            current.weatherIcons![0],
            height: 180,
            width: 180,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  /// Builds weather metrics info in a grid-style layout
  Widget _buildInfoGrid(WeatherProvider provider) {
    final current = provider.currentWeather!.current!;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueAccent.shade400,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          // First Row of Metrics
          Row(
            children: [
              _buildWeatherInfo("Feels Like", "${current.feelslike}\u00B0C"),
              _divider(),
              _buildWeatherInfo("Pressure", "${current.pressure} MB"),
              _divider(),
              _buildWeatherInfo("UV Index", "${current.uvIndex}"),
            ],
          ),
          const Divider(),
          // Second Row of Metrics
          Row(
            children: [
              _buildWeatherInfo("Wind Speed", "${current.windSpeed} Km/h"),
              _divider(),
              _buildWeatherInfo("Humidity", "${current.humidity}%"),
              _divider(),
              _buildWeatherInfo("Cloud Cover", "${current.cloudcover}%"),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds vertical divider between weather info blocks
  Widget _divider() => SizedBox(
    height: 40,
    child: VerticalDivider(color: Colors.grey, thickness: 1.5),
  );

  /// Builds individual weather info block with title and value
  Widget _buildWeatherInfo(String title, String value) {
    return Expanded(
      child: Column(
        children: [
          const Icon(Icons.cloud, size: 24, color: Colors.white),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds section titles like "Hourly Forecast" or "7 Days Forecast"
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }

  /// Builds list of forecast cards for upcoming 7 days
  Widget _buildWeeklyForecastList(Map<String, dynamic> forecast) {
    return ListView.builder(
      itemCount: forecast.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final date = forecast.keys.elementAt(index);
        final daily = forecast[date];
        return WeeklyForecastCard(data: daily, date: date);
      },
    );
  }
}
