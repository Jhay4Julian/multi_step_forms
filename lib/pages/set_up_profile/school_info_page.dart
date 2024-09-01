import 'package:flutter/material.dart';
import 'package:multi_step_forms/components/my_textfield.dart';

class SchoolInfoPage extends StatefulWidget {
  final GlobalKey formKey;
  final TextEditingController institutionController;
  final TextEditingController courseController;
  final TextEditingController levelController;
  final TextEditingController matricController;
  final Function(String?, String?, String?, String?) onSaved;
  const SchoolInfoPage(
      {super.key,
      required this.formKey,
      required this.institutionController,
      required this.courseController,
      required this.levelController,
      required this.matricController,
      required this.onSaved});

  @override
  State<SchoolInfoPage> createState() => _SchoolInfoPageState();
}

class _SchoolInfoPageState extends State<SchoolInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
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
                const SizedBox(height: 40),
                MyTextField(
                  titleController: widget.institutionController,
                  labelText: 'Institution',
                  validator: (text) => text!.isEmpty ? 'Required' : null,
                  onSaved: (value) {
                    widget.onSaved(
                      value,
                      widget.courseController.text,
                      widget.levelController.text,
                      widget.matricController.text,
                    );
                  },
                ),
                const SizedBox(height: 20),
                MyTextField(
                  titleController: widget.courseController,
                  labelText: 'Course',
                  validator: (text) => text!.isEmpty ? 'Required' : null,
                  onSaved: (value) {
                    widget.onSaved(
                      widget.institutionController.text,
                      value,
                      widget.levelController.text,
                      widget.matricController.text,
                    );
                  },
                ),
                const SizedBox(height: 20),
                MyTextField(
                  titleController: widget.levelController,
                  labelText: 'Level',
                  validator: (text) => text!.isEmpty ? 'Required' : null,
                  onSaved: (value) {
                    widget.onSaved(
                      widget.institutionController.text,
                      widget.courseController.text,
                      value,
                      widget.matricController.text,
                    );
                  },
                ),
                const SizedBox(height: 20),
                MyTextField(
                  titleController: widget.matricController,
                  labelText: 'Matric Number',
                  validator: (text) => text!.isEmpty ? 'Required' : null,
                  onSaved: (value) {
                    widget.onSaved(
                      widget.institutionController.text,
                      widget.courseController.text,
                      widget.levelController.text,
                      value,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
