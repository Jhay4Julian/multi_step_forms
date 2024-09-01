import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_step_forms/components/my_textfield.dart';

class PersonalInfoPage extends StatefulWidget {
  final GlobalKey formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController ageController;
  final TextEditingController genderController;
  final Function(String?, String?, String?, String?) onSaved;
  const PersonalInfoPage(
      {super.key,
      required this.formKey,
      required this.firstNameController,
      required this.lastNameController,
      required this.ageController,
      required this.genderController,
      required this.onSaved});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
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
                const SizedBox(height: 40),
                MyTextField(
                  titleController: widget.firstNameController,
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
                      widget.lastNameController.text,
                      widget.ageController.text,
                      widget.genderController.text,
                    );
                  },
                ),
                const SizedBox(height: 20),
                MyTextField(
                  titleController: widget.lastNameController,
                  labelText: 'Last Name',
                  validator: (text) => text!.isEmpty ? 'Required' : null,
                  onSaved: (value) {
                    widget.onSaved(
                      widget.firstNameController.text,
                      value,
                      widget.ageController.text,
                      widget.genderController.text,
                    );
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 80,
                      child: MyTextField(
                        titleController: widget.ageController,
                        labelText: 'Age',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (text) => text!.isEmpty ? 'Required' : null,
                        onSaved: (value) {
                          widget.onSaved(
                            widget.firstNameController.text,
                            widget.lastNameController.text,
                            value,
                            widget.genderController.text,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 50),
                    Expanded(
                      child: MyTextField(
                        titleController: widget.genderController,
                        labelText: 'Gender',
                        validator: (text) => text!.isEmpty ? 'Required' : null,
                        onSaved: (value) {
                          widget.onSaved(
                            widget.firstNameController.text,
                            widget.lastNameController.text,
                            widget.ageController.text,
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
