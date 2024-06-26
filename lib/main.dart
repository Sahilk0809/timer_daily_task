import 'package:flutter/material.dart';
import 'package:time_daily_task/analogue_clock/analogueClock.dart';
import 'package:time_daily_task/digital_clock/digital_clock_app.dart';
import 'package:time_daily_task/strap_clock/strapClock.dart';
import 'flutter_button/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/digital',
      routes: {
        '/': (context) => const Button(),
        '/digital': (context) => const DigitalClock(),
        '/analogue': (context) => const AnalogueClock(),
        '/strap': (context) => const StrapClock(),
      },
    );
  }
}

