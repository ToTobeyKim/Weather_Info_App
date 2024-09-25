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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter City Name',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('City');
              },
              child: Text('Fetch Weather'),
            ),
          ],
        ),
      ),
    );
  }
}