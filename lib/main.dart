import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 221, 255, 247)),// Root widget)
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
        body: Center(
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  Image.asset('assets/images/flutter-logo.png'),
                  const Text('Hello, World!'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      print('clicked');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutPage()),
                      );
                    },
                    child: const Text('Go to about page'),
                  ),
                ],
              );
            },
          ),
        ),
      );
  }
}


class AboutPage extends StatefulWidget {
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
          child: Column(
            children:[
              Text("About page!"),
              ElevatedButton(
                onPressed: () {
                  print('clicked');
                  Navigator.pop(context);
                },
                child: Text("Exit"),
              ),
            ]
          )
        )
    );
  }
}