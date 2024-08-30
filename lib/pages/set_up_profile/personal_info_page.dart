import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_step_forms/components/my_textfield.dart';

class PersonalInfoPage extends StatefulWidget {
  final GlobalKey formKey;
  const PersonalInfoPage({super.key, required this.formKey});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: widget.formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Profile',
                style: TextStyle(fontSize: 20, letterSpacing: 1),
              ),
              const SizedBox(height: 50),

              // FIRST NAME
              MyTextField(
                titleController: _firstNameController,
                labelText: 'First Name',
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Required';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 15),

              // LAST NAME
              MyTextField(
                titleController: _lastNameController,
                labelText: 'Last Name',
                validator: (text) => text!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 15),

              // GENDER & AGE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // AGE
                  SizedBox(
                    width: 80,
                    child: MyTextField(
                      titleController: _ageController,
                      labelText: 'Age',
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (text) => text!.isEmpty ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: 50),
                  // GENDER
                  Expanded(
                    child: MyTextField(
                      titleController: _genderController,
                      labelText: 'Gender',
                      validator: (text) => text!.isEmpty ? 'Required' : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
