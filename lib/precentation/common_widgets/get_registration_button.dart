import 'package:auth_neobis_app/precentation/screens/register_page.dart';
import 'package:flutter/material.dart';

class GetRegistrationButton extends StatelessWidget {
  const GetRegistrationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Нет аккаунта?'),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const RegistrationScreen(),
              ),
            );
          },
          child: const Text('Зарегистрироваться'),
        ),
      ],
    );
  }
}
