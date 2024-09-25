import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController cityController = TextEditingController();
  int temperature = 0;
  String weatherCondition = '';
  String cityName = '';
  final List<String> conditions = ["Sunny", "Cloudy", "Rainy"];
  final Random rand = Random();

  void fetchWeather() {
    setState(() {
      cityName = cityController.text;
      weatherCondition = conditions[rand.nextInt(conditions.length)];
      temperature = rand.nextInt(30) + 15;
    });
  }

  List<String> sevendayForecast() {
    List<String> forecast = [];
    for (int i = 0; i < 7; i++) {
      String condition = conditions[rand.nextInt(conditions.length)];
      int temp = rand.nextInt(30) + 15;
      forecast.add('Day ${i + 1}: $condition, ${temp}°C');
    }
    return forecast;
  }

  void showForecast() {
    List<String> forecastData = sevendayForecast();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('7-Day Weather Forecast'),
          content: SizedBox(
            width: 200,
            height: 200,
            child: ListView.builder(
              itemCount: forecastData.length,
              itemBuilder: (context, index) {
                return Text(forecastData[index]);
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: 'Enter City Name',
              ),
            ),
            ElevatedButton(
              onPressed: fetchWeather,
              child: const Text('Fetch Weather'),
            ),
            const SizedBox(height: 15),
            Text('City: $cityName'),
            Text('Temperature: $temperature °C'),
            Text('Condition: $weatherCondition'),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: showForecast,
              child: const Text('Show 7-Day Forecast'),
            ),
          ],
        ),
      ),
    );
  }
}