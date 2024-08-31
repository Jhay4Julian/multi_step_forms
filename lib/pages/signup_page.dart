import 'package:flutter/material.dart';
import 'package:multi_step_forms/pages/register_page.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController =
      TextEditingController(text: 'default@email.com');
  final TextEditingController _passwordController =
      TextEditingController(text: 'Password123');
  final TextEditingController _confirmPasswordController =
      TextEditingController(text: 'Password123');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isHidden = true;

  // Validate Form
  void _validateSignUp() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const RegisterPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
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
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Enter an email address';
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
                  MyTextField(
                    titleController: _passwordController,
                    labelText: 'Password',
                    obscureText: isHidden,
                    suffixWidget: InkWell(
                      onTap: () {
                        setState(() {
                          isHidden = !isHidden;
                        });
                      },
                      child: Icon(
                        isHidden ? Icons.visibility : Icons.visibility_off,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Enter password';
                      }

                      if (text.contains(' ')) {
                        return 'Password can not include whitespaces';
                      }

                      if (text.length < 8) {
                        return 'Password must be at least 8 characters';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    obscureText: true,
                    titleController: _confirmPasswordController,
                    labelText: 'Confirm Password',
                    validator: (text) {
                      if (_passwordController.text !=
                          _confirmPasswordController.text) {
                        return 'Passwords do not match';
                      }

                      return null;
                    },
                  ),
                ],
              ),
              MyButton(title: 'Sign Up', onTap: _validateSignUp)
            ],
          ),
        ),
      ),
    );
  }
}
