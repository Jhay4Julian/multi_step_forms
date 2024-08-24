import 'package:flutter/material.dart';
import 'package:multi_step_forms/components/my_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock,
              size: 100,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 50),
            MyButton(title: 'Sign Up', onTap: () {}),
            const SizedBox(height: 20),
            MyButton(title: 'Log In', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
