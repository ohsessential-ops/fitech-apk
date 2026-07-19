import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class TimezoneClock extends StatefulWidget {
  final String timezone;
  final String label;

  const TimezoneClock({
    Key? key,
    required this.timezone,
    required this.label,
  }) : super(key: key);

  @override
  State<TimezoneClock> createState() => _TimezoneClockState();
}

class _TimezoneClockState extends State<TimezoneClock> {
  late Timer _timer;
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _updateTime(),
    );
  }

  void _updateTime() {
    setState(() {
      try {
        final now = DateTime.now().toUtc();
        final formatter = DateFormat('HH:mm:ss');
        _currentTime = formatter.format(now.add(
          Duration(hours: _getTimezoneOffset(widget.timezone)),
        ));
      } catch (e) {
        _currentTime = '--:--:--';
      }
    });
  }

  int _getTimezoneOffset(String timezone) {
    final offsets = {
      'UTC': 0,
      'GMT': 0,
      'EST': -5,
      'EDT': -4,
      'CST': -6,
      'CDT': -5,
      'MST': -7,
      'MDT': -6,
      'PST': -8,
      'PDT': -7,
      'IST': 5,
      'JST': 9,
      'AEST': 10,
      'AEDT': 11,
      'SGT': 8,
      'HKT': 8,
      'CET': 1,
      'CEST': 2,
      'GST': 4,
      'PKT': 5,
    };
    return offsets[timezone] ?? 0;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade300, Colors.blue.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _currentTime,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Courier',
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.timezone,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white60,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
