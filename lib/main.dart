import 'package:flutter/material.dart';
import 'package:mosam/config/remote/network_client.dart';
import 'package:mosam/config/services/location_services.dart';
import 'package:mosam/providers/weather_provider.dart';
import 'package:mosam/views/dashboard_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WeatherProvider(
            networkClient: NetworkClient(),
            locationService: LocationService(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: DashboardPage(),
      ),
    );
  }
}
