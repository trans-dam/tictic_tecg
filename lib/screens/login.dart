import 'package:flutter/material.dart';
import 'package:tictic/screens/layouts/form_layout.dart';
import 'package:tictic/screens/register.dart';
import 'package:tictic/styles/colors.dart';

import '../styles/fonts.dart';
import '../widgets/forms/login_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return FormLayout(
      form: LoginForm(),
      addForgotPassword: true,
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
