import 'package:flutter/material.dart';
import 'package:multi_step_forms/components/my_button.dart';
import 'package:multi_step_forms/components/my_textfield.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                'Log In',
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
                ],
              ),
              MyButton(title: 'Login', onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
