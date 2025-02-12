import 'package:flutter/material.dart';

class ForecastWeather extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temperature;
  const ForecastWeather(
      {super.key,
      required this.time,
      required this.icon,
      required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 16,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        width: 100,
        child: Column(
          children: [
            Text(
              time,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Icon(
              icon,
              size: 32,
            ),
            SizedBox(height: 8),
            Text(temperature),
          ],
        ),
      ),
    );
  }
}

// return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(
    //       16,
    //     ),
    //   ),
    //   width: 90,
    //   child: Card(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
    //       child: Column(
    //         children: [
    //           Text(
    //             "03:00",
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           Icon(Icons.cloud),
    //           Text("320.12"),
    //         ],
    //       ),
    //     ),
    //   ),
    // );