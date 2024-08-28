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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool notVisible = true;
  bool loggedIn = false;

  void _validate() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      setState(() {
        loggedIn = true;
        email = _emailController.text;
        password = _passwordController.text;
      });
    }
  }

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: loggedIn ? _buildSuccess() : _buildLoginPage(),
      ),
    );
  }

  Widget _buildSuccess() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle,
            shadows: [
              Shadow(
                  color: Colors.purple.shade100,
                  blurRadius: 1,
                  offset: const Offset(3, -3))
            ],
            size: 100,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginPage() {
    return Form(
      key: _formKey,
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
                // Email TextField
                MyTextField(
                  obscureText: false,
                  titleController: _emailController,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Enter email address';
                    }

                    final regex = RegExp(
                        r'^[a-zA-Z0-9._+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

                    if (!regex.hasMatch(text)) {
                      return 'Enter a valid email';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Password TextField
                MyTextField(
                  titleController: _passwordController,
                  labelText: 'Password',
                  obscureText: notVisible,
                  suffixWidget: InkWell(
                    onTap: () {
                      setState(() {
                        notVisible = !notVisible;
                      });
                    },
                    child: Icon(
                      notVisible ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Enter password';
                    }

                    if (text.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }

                    return null;
                  },
                ),
              ],
            ),
            MyButton(title: 'Login', onTap: _validate),
          ],
        ),
      ),
    );
  }
}
