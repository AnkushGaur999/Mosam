import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeeklyForecastCard extends StatelessWidget {
  final String date;
  final Map<String, dynamic> data;

  const WeeklyForecastCard({super.key, required this.date, required this.data});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(
      'EEE, MMM d',
    ).format(DateTime.parse(date)); // e.g., Mon, Mar 18
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: ListTile(
        leading: const Icon(Icons.wb_sunny, color: Colors.orange),
        title: Text(formattedDate),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Min: ${data["mintemp"]}°C, Max: ${data["maxtemp"]}°C'),
            Text(
              'Sunrise: ${data["astro"]["sunrise"]}, Sunset: ${data["astro"]["sunset"]}',
            ),
            Text('UV Index: ${data["uv_index"]}'),
          ],
        ),
      ),
    );
  }
}
