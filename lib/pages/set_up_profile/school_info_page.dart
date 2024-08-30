import 'package:flutter/material.dart';
import 'package:multi_step_forms/components/my_textfield.dart';

class SchoolInfoPage extends StatefulWidget {
  final GlobalKey formKey;
  const SchoolInfoPage({super.key, required this.formKey});

  @override
  State<SchoolInfoPage> createState() => _SchoolInfoPageState();
}

class _SchoolInfoPageState extends State<SchoolInfoPage> {
  final _universityController = TextEditingController();
  final _courseController = TextEditingController();
  final _levelController = TextEditingController();
  final _matricController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: widget.formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Education',
                style: TextStyle(fontSize: 20, letterSpacing: 1),
              ),
              const SizedBox(height: 50),

              //
              MyTextField(
                titleController: _universityController,
                labelText: 'Institution',
                validator: (text) => text!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 15),

              //
              MyTextField(
                titleController: _courseController,
                labelText: 'Course',
                validator: (text) => text!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 15),

              //
              MyTextField(
                titleController: _levelController,
                labelText: 'Level',
                validator: (text) => text!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 15),

              //
              MyTextField(
                titleController: _matricController,
                labelText: 'Matric Number',
                validator: (text) => text!.isEmpty ? 'Required' : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
