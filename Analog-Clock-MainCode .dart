import 'dart:async';

import 'package:flutter/material.dart';

import 'clockpainter.dart'; // Aapki ClockPainter class wali file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnalogClockScreen(),
    );
  }
}

class AnalogClockScreen extends StatefulWidget {
  const AnalogClockScreen({super.key});

  @override
  State<AnalogClockScreen> createState() => _AnalogClockScreenState();
}

class _AnalogClockScreenState extends State<AnalogClockScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Har 1 second baad UI update karne ke liye
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Memory leak se bachne ke liye timer close karna zaroori hai
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(211, 236, 227, 146),
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(250),
            color: Colors.white,
          ),
          child: SizedBox(
            width: 450,
            height: 450,
            child: CustomPaint(painter: ClockPainter(dateTime: DateTime.now())),
          ),
        ),
      ),
    );
  }
}
