import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_step_forms/components/my_textfield.dart';

class PersonalInfoPage extends StatefulWidget {
  final GlobalKey formKey;
  final Function(String?, String?, String?, String?) onSaved;
  const PersonalInfoPage(
      {super.key, required this.formKey, required this.onSaved});

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
      body: SafeArea(
        child: Form(
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
                MyTextField(
                  titleController: _firstNameController,
                  labelText: 'First Name',
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Required';
                    }

                    return null;
                  },
                  onSaved: (value) {
                    widget.onSaved(
                      value,
                      _lastNameController.text,
                      _ageController.text,
                      _genderController.text,
                    );
                  },
                ),
                const SizedBox(height: 15),
                MyTextField(
                  titleController: _lastNameController,
                  labelText: 'Last Name',
                  validator: (text) => text!.isEmpty ? 'Required' : null,
                  onSaved: (value) {
                    widget.onSaved(
                      _firstNameController.text,
                      value,
                      _ageController.text,
                      _genderController.text,
                    );
                  },
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 80,
                      child: MyTextField(
                        titleController: _ageController,
                        labelText: 'Age',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (text) => text!.isEmpty ? 'Required' : null,
                        onSaved: (value) {
                          widget.onSaved(
                            _firstNameController.text,
                            _lastNameController.text,
                            value,
                            _genderController.text,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 50),
                    Expanded(
                      child: MyTextField(
                        titleController: _genderController,
                        labelText: 'Gender',
                        validator: (text) => text!.isEmpty ? 'Required' : null,
                        onSaved: (value) {
                          widget.onSaved(
                            _firstNameController.text,
                            _lastNameController.text,
                            _ageController.text,
                            value,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
