import 'package:flutter/material.dart';
import 'package:multi_step_forms/components/my_button.dart';
import 'package:multi_step_forms/pages/login_page.dart';
import 'package:multi_step_forms/pages/signup_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.money_off,
              shadows: [
                Shadow(
                    color: Colors.purple.shade100,
                    blurRadius: 1,
                    offset: const Offset(3, -3))
              ],
              size: 120,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 50),
            Column(
              children: [
                MyButton(
                  title: 'Sign Up',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                MyButton(
                  title: 'Log In',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogInPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
