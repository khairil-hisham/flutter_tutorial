import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_tutorial/providers/app_state.dart';
import 'package:flutter_tutorial/pages/splash_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppState(),
        child: MaterialApp(
          theme: ThemeData(
              scaffoldBackgroundColor:
                  Color.fromARGB(255, 221, 255, 247)), // Root widget)
          home: const SplashPage(),
        ));
  }
}


