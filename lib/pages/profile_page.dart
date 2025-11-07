import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_tutorial/providers/app_state.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Text(
          'current theme : ${context.watch<AppState>().darkMode ? 'dark mode' : 'light mode'}'),
      SwitchListTile(
        title: const Text('Dark Mode'),
        value: context.watch<AppState>().darkMode,
        onChanged: (value) =>
            setState(() => context.read<AppState>().setDarkMode(value)),
      ),
      const SizedBox(height: 20),
      TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter username',
        ),
        controller: nameController,
      ),
      ElevatedButton(
          onPressed: () {
            context.read<AppState>().setUsername(nameController.text);
          },
          child: const Text('Set username'))
    ]));
  }
}
