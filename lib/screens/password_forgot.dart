import 'package:flutter/material.dart';
import 'package:tictic/screens/layouts/form_layout.dart';
import 'package:tictic/screens/register.dart';
import 'package:tictic/styles/colors.dart';
import 'package:tictic/widgets/forms/password_forgot_form.dart';

import '../styles/fonts.dart';

class PasswordForgot extends StatelessWidget {
  const PasswordForgot({super.key});

  @override
  Widget build(BuildContext context) {
    return FormLayout(
      form: PasswordForgotForm(),
      label: 'Je n’ai pas encore de compte.',
      link: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Register(),
            ),
          );
        },
        child: Text(
          'Créer mon compte !',
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
