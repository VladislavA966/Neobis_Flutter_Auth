import 'package:auth_neobis_app/precentation/common_widgets/auth_text_form_field.dart';
import 'package:auth_neobis_app/precentation/common_widgets/custom_button.dart';
import 'package:auth_neobis_app/precentation/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController checkPassword = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
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
                controller: userName,
                hintText: CustomTextFormFieldHint.name,
                validate: (value) {
                  return checkName(value);
                },
              ),
              CustomTextFormField(
                  controller: userPassword,
                  validate: (value) {
                    return passwordLengthCheck(value);
                  },
                  hintText: CustomTextFormFieldHint.password),
              CustomTextFormField(
                  controller: checkPassword,
                  validate: (value) {
                    return passwordsCheck(value);
                  },
                  hintText: CustomTextFormFieldHint.checkPassword),
              CustomButton(
                title: CustomButtonTitle.register,
                onPressed: () async {
                  getRegistration(context);
                  await saveUserData();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', userName.text);
    await prefs.setString('userPassword', userPassword.text);
  }

  String? passwordsCheck(String? value) {
    if (value == null || value != checkPassword.text) {
      return 'Пароли не совпадают';
    }
    return null;
  }

  String? passwordLengthCheck(String? value) {
    if (value == null || value.length < 6) {
      return 'Пароль должен содержать не меньше 6 символов';
    }
    return null;
  }

  void getRegistration(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Регистрация прошла успешно'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthPAge(),
        ),
      );
    }
  }

  String? checkName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле не может быть пустым';
    }
    return null;
  }
}
