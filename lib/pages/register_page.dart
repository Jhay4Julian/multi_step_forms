import 'package:flutter/material.dart';
import 'package:multi_step_forms/pages/set_up_profile/personal_info_page.dart';
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

  int _currentPage = 0;

  // go to next page
  void _nextPage() {
    if ((_currentPage == 0 && _profileFormKey.currentState!.validate()) ||
        (_currentPage == 1 && _schoolFormKey.currentState!.validate())) {
      _pageController.nextPage(
          duration: const Duration(microseconds: 300), curve: Curves.ease);
    }
  }

  // go to previous page
  void _previousPage() {
    _pageController.previousPage(
        duration: const Duration(microseconds: 300), curve: Curves.ease);
  }

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
          PersonalInfoPage(formKey: _profileFormKey),
          SchoolInfoPage(formKey: _schoolFormKey),
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
            ],
          ),
        ),
      ),
    );
  }
}
