import 'package:flutter/material.dart';

class PreviewPage extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String age;
  final String gender;
  final String institution;
  final String course;
  final String level;
  final String matricNumber;
  const PreviewPage({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.institution,
    required this.course,
    required this.level,
    required this.matricNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Name'),
            subtitle: Text('$firstName $lastName'),
          ),
          ListTile(
            title: const Text('Age'),
            subtitle: Text(age),
          ),
          ListTile(
            title: const Text('Gender'),
            subtitle: Text(gender),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: const Text('Institution'),
            subtitle: Text(institution),
          ),
          ListTile(
            title: const Text('Course'),
            subtitle: Text(course),
          ),
          ListTile(
            title: const Text('Level'),
            subtitle: Text(level),
          ),
          ListTile(
            title: const Text('Matric Number'),
            subtitle: Text(matricNumber),
          )
        ],
      ),
    );
  }
}
