import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForeCastContainer extends StatefulWidget {
  const ForeCastContainer({Key? key}) : super(key: key);

  @override
  _ForeCastContainerState createState() => _ForeCastContainerState();
}

class _ForeCastContainerState extends State<ForeCastContainer> {
  String _city = '';
  String _weather = '';
  double _temperature = 0;
  String _iconCode = '';
  String _searchQuery = '';
  List<Map<String, dynamic>> _forecastData = [];

  Future<void> fetchWeather(String city) async {
    final apiKey = '09800920b781c2b04bdc5ab2a3929dda';
    final apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final weatherData = jsonDecode(response.body);
      setState(() {
        _city = weatherData['name'];
        _weather = weatherData['weather'][0]['description'];
        _temperature = (weatherData['main']['temp'] - 273.15);
        _iconCode = weatherData['weather'][0]['icon'];
      });
    } else {
      throw Exception('Failed to load weather data');
    }

    // Fetch forecast data
    final forecastUrl =
        'http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey';
    final forecastResponse = await http.get(Uri.parse(forecastUrl));
    if (forecastResponse.statusCode == 200) {
      final forecastData = jsonDecode(forecastResponse.body);
      setState(() {
        _forecastData = List<Map<String, dynamic>>.from(forecastData['list']);
      });
    } else {
      throw Exception('Failed to load forecast data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather('Mogadishu');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            onSubmitted: (value) {
              fetchWeather(value);
            },
            decoration: InputDecoration(
              hintText: 'Search for a city',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Text(
          _city.isNotEmpty ? _city : 'Loading...',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _temperature.toStringAsFixed(1) + '°C',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 10),
            _iconCode.isNotEmpty
                ? Image.network(
                    'http://openweathermap.org/img/wn/$_iconCode.png',
                    width: 50,
                    height: 50,
                  )
                : SizedBox(),
          ],
        ),
        SizedBox(height: 10),
        Text(
          _weather.isNotEmpty ? _weather : 'Loading...',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        _forecastData.isNotEmpty
            ? Column(
                children: [
                  Text(
                    'Forecast',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _forecastData.map((forecast) {
                        final DateTime dateTime =
                            DateTime.fromMillisecondsSinceEpoch(
                                forecast['dt'] * 1000);
                        final String temperature =
                            (forecast['main']['temp'] - 273.15)
                                    .toStringAsFixed(1) +
                                '°C';
                        final String iconCode = forecast['weather'][0]['icon'];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              Text(
                                '${dateTime.hour}:00',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Image.network(
                                'http://openweathermap.org/img/wn/$iconCode.png',
                                width: 40,
                                height: 40,
                              ),
                              Text(temperature),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              )
            : SizedBox(),
      ],
    );
  }
}
