import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              Column(
                children: [
                  MyTextField(
                    titleController: _emailController,
                    labelText: 'Email',
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    titleController: _passwordController,
                    labelText: 'Password',
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    titleController: _confirmPasswordController,
                    labelText: 'Confirm Password',
                  ),
                ],
              ),
              MyButton(title: 'Sign Up', onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
