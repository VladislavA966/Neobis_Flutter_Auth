import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validate;
  final CustomTextFormFieldHint hintText;
  CustomTextFormField({
    Key? key,
    required this.validate,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validate,
        decoration: InputDecoration(
          hintText: getHintText(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }

  String getHintText() {
    switch (widget.hintText) {
      case CustomTextFormFieldHint.name:
        return 'Введите ваше имя';
      case CustomTextFormFieldHint.checkPassword:
        return 'Повторите пароль';
      case CustomTextFormFieldHint.password:
        return 'Введите пароль';
      default:
        return '';
    }
  }
}

enum CustomTextFormFieldHint {
  name,
  checkPassword,
  password,
}
