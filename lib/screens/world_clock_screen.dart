import 'package:flutter/material.dart';
import '../widgets/timezone_clock.dart';

class WorldClockScreen extends StatefulWidget {
  const WorldClockScreen({Key? key}) : super(key: key);

  @override
  State<WorldClockScreen> createState() => _WorldClockScreenState();
}

class _WorldClockScreenState extends State<WorldClockScreen> {
  final List<Map<String, String>> timezones = [
    {'timezone': 'UTC', 'label': 'London'},
    {'timezone': 'EST', 'label': 'New York'},
    {'timezone': 'CST', 'label': 'Chicago'},
    {'timezone': 'PST', 'label': 'Los Angeles'},
    {'timezone': 'IST', 'label': 'India'},
    {'timezone': 'JST', 'label': 'Tokyo'},
    {'timezone': 'SGT', 'label': 'Singapore'},
    {'timezone': 'AEST', 'label': 'Sydney'},
    {'timezone': 'CET', 'label': 'Paris'},
    {'timezone': 'GST', 'label': 'Dubai'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('World Clock'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue.shade700,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.blue.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: timezones.length,
          itemBuilder: (context, index) {
            final tz = timezones[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TimezoneClock(
                timezone: tz['timezone']!,
                label: tz['label']!,
              ),
            );
          },
        ),
      ),
    );
  }
}
