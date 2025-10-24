import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

void main() async {
  try{
    final response = await http.get(Uri.parse('http://localhost:5039/')).timeout(const Duration(seconds:3));
    if(response.statusCode == 200) print(response.body);
  }catch(e){
    print("error connecting to .net backend");
  }
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 221, 255, 247)),// Root widget)
      home: BottomNavScreen(),
    );
  }
}

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        // keeps state of each page
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
              SizedBox(height:20),
              DigitalClock(),
              SizedBox(height:20),
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


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SwitchListTile(
        title: const Text('Dark Mode'),
        value: _darkMode,
        onChanged: (value) => setState(() => _darkMode = value),
      ),
    );
  }
}
