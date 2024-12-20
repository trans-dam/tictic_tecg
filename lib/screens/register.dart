import 'package:flutter/material.dart';
import 'package:tictic/screens/layouts/form_layout.dart';
import 'package:tictic/screens/login.dart';
import 'package:tictic/styles/colors.dart';

import '../styles/fonts.dart';
import '../widgets/forms/register_form.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return FormLayout(
      form: const RegisterForm(),
      label: 'J’ai déjà un compte',
      link: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
          );
        },
        child: Text(
          'Je me connecte',
          style: kLabelStyle.apply(
            color: kMainColor,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
