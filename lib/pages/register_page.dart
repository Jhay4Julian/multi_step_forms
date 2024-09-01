import 'package:flutter/material.dart';
import 'package:multi_step_forms/pages/set_up_profile/personal_info_page.dart';
import 'package:multi_step_forms/pages/set_up_profile/preview_page.dart';
import 'package:multi_step_forms/pages/set_up_profile/school_info_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final PageController _pageController = PageController();
  final _profileFormKey = GlobalKey<FormState>();
  final _schoolFormKey = GlobalKey<FormState>();

  // controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  final TextEditingController _institutionController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();
  final TextEditingController _matricNumberController = TextEditingController();

  int _currentPage = 0;

  // go to next page
  void _nextPage() {
    if ((_currentPage == 0 && _profileFormKey.currentState!.validate()) ||
        (_currentPage == 1 && _schoolFormKey.currentState!.validate())) {
      // save data before going to next page
      if (_currentPage == 0) {
        _profileFormKey.currentState!.save();
      } else if (_currentPage == 1) {
        _schoolFormKey.currentState!.save();
      }
      _pageController.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.ease);
    }
  }

  // go to previous page
  void _previousPage() {
    _pageController.previousPage(
        duration: const Duration(seconds: 1), curve: Curves.ease);
  }

  String? firstName;
  String? lastName;
  String? age;
  String? gender;

  String? institution;
  String? course;
  String? level;
  String? matricNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          PersonalInfoPage(
              formKey: _profileFormKey,
              firstNameController: _firstNameController,
              lastNameController: _lastNameController,
              ageController: _ageController,
              genderController: _genderController,
              onSaved: (firstNameValue, lastNameValue, ageValue, genderValue) {
                firstName = firstNameValue;
                lastName = lastNameValue;
                age = ageValue;
                gender = genderValue;
              }),
          SchoolInfoPage(
            formKey: _schoolFormKey,
            institutionController: _institutionController,
            courseController: _courseController,
            levelController: _levelController,
            matricController: _matricNumberController,
            onSaved:
                (institutionValue, courseValue, levelValue, matricNumberValue) {
              institution = institutionValue;
              course = courseValue;
              level = levelValue;
              matricNumber = matricNumberValue;
            },
          ),
          PreviewPage(
            firstName: firstName ?? '',
            lastName: lastName ?? '',
            age: age ?? '',
            gender: gender ?? '',
            institution: institution ?? '',
            course: course ?? '',
            level: level ?? '',
            matricNumber: matricNumber ?? '',
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: BottomAppBar(
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _currentPage > 0
                  ? IconButton(
                      onPressed: _previousPage,
                      icon: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : const SizedBox.shrink(),
              if (_currentPage < 2)
                ElevatedButton(
                  onPressed: _nextPage,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Continue',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              if (_currentPage == 2)
                ElevatedButton(
                  onPressed: _nextPage,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
