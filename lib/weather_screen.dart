import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_information_item.dart';
import 'package:weather_app/api.dart';
import 'package:weather_app/weather_forecast_item.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      final res = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?id=524901&appid=$key'));

      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw 'Error';
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator.adaptive());
          }

          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          final data = snapshot.data!;
          final currentWeather = data['list'][0]['main']['temp'];
          final currentSky = data['list'][0]['weather'][0]['main'];
          final currentHumidity = data['list'][0]['main']['humidity'];
          final currentWind = data['list'][0]['wind']['speed'];
          final currentPressure = data['list'][0]['main']['pressure'];

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Weather App",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    getCurrentWeather();
                  },
                  icon: Icon(
                    Icons.refresh,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  "${currentWeather} K",
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Icon(
                                  currentSky == 'Clouds' || currentSky == 'Rain'
                                      ? Icons.cloud
                                      : Icons.sunny,
                                  size: 64,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  currentSky,
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Hourly Forecast",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ForecastWeather(
                          time: "00:00",
                          icon: Icons.cloud,
                          temperature: "301.22",
                        ),
                        ForecastWeather(
                          time: "03:00",
                          icon: Icons.sunny,
                          temperature: "300.52",
                        ),
                        ForecastWeather(
                          time: "06:00",
                          icon: Icons.cloud,
                          temperature: "302.22",
                        ),
                        ForecastWeather(
                          time: "09:00",
                          icon: Icons.sunny,
                          temperature: "300.12",
                        ),
                        ForecastWeather(
                          time: "12:00",
                          icon: Icons.cloud,
                          temperature: "301.22",
                        ),
                        ForecastWeather(
                          time: "15:00",
                          icon: Icons.sunny,
                          temperature: "300.52",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Additional Information",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AdditionalInformationItem(
                        icon: Icons.water_drop,
                        label: "Humidity",
                        value: "$currentHumidity",
                      ),
                      AdditionalInformationItem(
                        icon: Icons.air,
                        label: "Wind Speed",
                        value: "$currentWind",
                      ),
                      AdditionalInformationItem(
                        icon: Icons.beach_access,
                        label: "Pressure",
                        value: "$currentPressure",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
