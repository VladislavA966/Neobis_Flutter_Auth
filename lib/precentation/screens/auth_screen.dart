import 'package:auth_neobis_app/precentation/common_widgets/auth_text_form_field.dart';
import 'package:auth_neobis_app/precentation/common_widgets/custom_button.dart';
import 'package:auth_neobis_app/precentation/common_widgets/get_registration_button.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPAge extends StatefulWidget {
  const AuthPAge({super.key});

  @override
  State<AuthPAge> createState() => _AuthPAgeState();
}

class _AuthPAgeState extends State<AuthPAge> {
  String? userName;
  String? userPaasword;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                hintText: CustomTextFormFieldHint.name,
                validate: validateName,
                controller: TextEditingController(),
              ),
              CustomTextFormField(
                hintText: CustomTextFormFieldHint.password,
                validate: validatePassword,
                controller: TextEditingController(),
              ),
              CustomButton(
                title: CustomButtonTitle.signUp,
                onPressed: () {
                  getAuth(context);
                },
              ),
              const GetRegistrationButton(),
            ],
          ),
        ),
      ),
    );
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty || value != userName) {
      return 'Неверное имя или пароль';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value != userPaasword) {
      return 'Неверное имя или пароль';
    }
    return null;
  }

  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('userName') ?? '';
    userPaasword = prefs.getString('userPassword') ?? '';
  }

  void getAuth(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Авторизация прошла успешно'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
}
