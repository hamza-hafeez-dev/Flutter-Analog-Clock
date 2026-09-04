import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  ClockPainter({required this._dateTime});
  final DateTime _dateTime;
  @override
  void paint(Canvas canvas, Size size) {
    final Size(:height, :width) = size;

    // Radius Of Clock
    final radius = min(height, width) / 2;
    // Angle Of Ticks
    final angle = pi * 2 / 60;

    // Hour Tick
    final hourTickWidth = radius * 0.034;
    final hourTickLength = radius * 0.15;
    // Minutes Tick
    final minutesTickWidth = radius * 0.022;
    final minutesTickLength = radius * 0.11;

    //HourNeedle
    final hourNeedleLength = radius * 0.5;
    final hourNeedleWidth = radius * 0.05;
    final hourNeedleBase = radius * 0.08;

    //MinutesNeedle
    final minutesNeedlelength = radius * 0.3;
    final minutesNeedleWidth = radius * 0.035;
    final minutesNeedleBase = radius * 0.055;

    //SecondsNeedle
    final secondsNeedlelength = radius * 0.25;
    final secondsNeedleWidth = radius * 0.02;
    final secondsNeedleBase = radius * 0.025;

    //Center
    final center = Offset(width / 2, height / 2);

    final paint = Paint()
      ..color = Colors.blue.shade900
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    final hourTickPaint = Paint()
      ..color = Colors.yellow.shade500
      ..strokeCap = StrokeCap.round
      ..strokeWidth = hourTickWidth;

    final minutesTickpaint = Paint()
      ..color = Colors.blue.shade900
      ..strokeCap = StrokeCap.round
      ..strokeWidth = minutesTickWidth;

    final hourNeedlePaint = Paint()
      ..color = Colors.blue.shade900
      ..strokeCap = StrokeCap.round
      ..strokeWidth = hourNeedleWidth;

    final minutesNeedlePaint = Paint()
      ..color = Colors.blue.shade900
      ..strokeCap = StrokeCap.round
      ..strokeWidth = minutesNeedleWidth;

    final secondsNeedlePaint = Paint()
      ..color = Colors.red.shade600
      ..strokeCap = StrokeCap.round
      ..strokeWidth = secondsNeedleWidth;

    final minutesNeedleBasePaint = Paint()
      ..color = Colors.yellow.shade500
      ..strokeWidth = minutesNeedleBase;
    final hourNeedleBasePaint = Paint()
      ..color = const Color.fromARGB(117, 255, 235, 59)
      ..strokeWidth = minutesNeedleBase;
    final secondsNeedleBasePaint = Paint()
      ..color = Colors.red.shade600
      ..strokeWidth = secondsNeedleBase;

    canvas.drawCircle(center, radius, paint);
    canvas.drawCircle(center, hourNeedleBase, hourNeedleBasePaint);
    canvas.drawCircle(center, minutesNeedleBase, minutesNeedleBasePaint);
    canvas.drawCircle(center, secondsNeedleBase, secondsNeedleBasePaint);

    // Origin Move to Center
    canvas.translate(center.dx, center.dy);
    canvas.save();

    for (var i = 1; i <= 60; i++) {
      canvas.rotate(angle);
      var isHours = i % 5 == 0;

      if (isHours) {
        canvas.drawLine(
          Offset(0, -radius),
          Offset(0, -(radius - hourTickLength)),
          hourTickPaint,
        );
      } else {
        canvas.drawLine(
          Offset(0, -radius),
          Offset(0, -(radius - minutesTickLength)),
          minutesTickpaint,
        );
      }
      if (hours == (i / 5)) {
        canvas.drawLine(
          Offset(0, -hourNeedleBase),
          Offset(0, -(radius - hourNeedleLength)),
          hourNeedlePaint,
        );
      }
      if (_dateTime.minute == i) {
        canvas.drawLine(
          Offset(0, -minutesNeedleBase),
          Offset(0, -(radius - minutesNeedlelength)),
          minutesNeedlePaint,
        );
      }
      if (_dateTime.second == i) {
        canvas.drawLine(
          Offset(0, -secondsNeedleBase),
          Offset(0, -(radius - secondsNeedlelength)),
          secondsNeedlePaint,
        );
      }
    }

    canvas.restore();
  }

  int get hours => _dateTime.hour > 12 ? _dateTime.hour - 12 : _dateTime.hour;

  @override
  bool shouldRepaint(covariant ClockPainter oldDelegate) =>
      oldDelegate._dateTime != _dateTime;

  @override
  bool shouldRebuildSemantics(covariant ClockPainter oldDelegate) =>
      oldDelegate._dateTime != _dateTime;
}
