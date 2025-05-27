import 'package:flutter/material.dart';

class HourlyForecastCard extends StatelessWidget {
  final List<Map<String, dynamic>> hourlyData;

  const HourlyForecastCard({super.key, required this.hourlyData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: hourlyData.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final hour = hourlyData[index];
          return Container(
            width: 100,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  hour['time'],
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Image.network(hour['icon'], width: 36, height: 36),
                const SizedBox(height: 8),
                Text('${hour['temperature']}°C'),
              ],
            ),
          );
        },
      ),
    );
  }
}
