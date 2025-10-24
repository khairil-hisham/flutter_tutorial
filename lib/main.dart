import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_tutorial/globals.dart' as globals;
import 'package:flutter_tutorial/about_page.dart';

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
                  Text('Hello, ${globals.currentUser}'),
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


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SwitchListTile(
        title: const Text('Dark Mode'),
        value: globals.darkMode,
        onChanged: (value) => setState(() => globals.darkMode = value),
      ),
    );
  }
}
