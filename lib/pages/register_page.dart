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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          PersonalInfoPage(formKey: _profileFormKey),
          SchoolInfoPage(formKey: _schoolFormKey),
        ],
      ),
    );
  }
}
