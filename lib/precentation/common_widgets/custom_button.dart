import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final CustomButtonTitle title;
  final Function() onPressed;

  const CustomButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: widget.onPressed,
        child: Text(getButtonTitle()),
      ),
    );
  }

  String getButtonTitle() {
    switch (widget.title) {
      case CustomButtonTitle.register:
        return 'Зарегистрироваться';
      case CustomButtonTitle.signUp:
        return 'Войти';
      default:
        return '';
    }
  }
}

enum CustomButtonTitle { register, signUp }
