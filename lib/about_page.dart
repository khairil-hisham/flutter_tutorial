import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';


class AboutPage extends StatefulWidget {
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      Text("About page!"),
      SizedBox(height: 20),
      DigitalClock(),
      SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {
          print('clicked');
          Navigator.pop(context);
        },
        child: Text("Exit"),
      ),
    ])));
  }
}

class DigitalClock extends StatefulWidget {
  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  late Timer _timer;
  late DateTime _now;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "${_now.hour.toString().padLeft(2, '0')}:"
      "${_now.minute.toString().padLeft(2, '0')}:"
      "${_now.second.toString().padLeft(2, '0')}",
      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
    );
  }
}
