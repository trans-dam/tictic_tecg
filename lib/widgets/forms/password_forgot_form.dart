import 'package:flutter/material.dart';
import 'package:tictic/screens/home.dart';
import 'package:tictic/utils/validations.dart';
import 'package:tictic/widgets/button.dart';
import 'package:tictic/widgets/password_input.dart';
import 'package:tictic/widgets/text_input.dart';

class PasswordForgotForm extends StatelessWidget {
  PasswordForgotForm({super.key});

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  String _email = "ada@example.com";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: Column(
        children: [
          TextInput(
            prefixIcon: Icons.mail,
            hintText: 'exemple@mail.com',
            labelText: 'Adresse mail',
            initialValue: _email,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              _email = value;
            },
            validator: validateEmail,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button(
                  onTap: () async {
                    if (_registerFormKey.currentState != null &&
                        _registerFormKey.currentState!.validate()) {}
                  },
                  label: 'Je réinitialise mon mot de passe'),
            ],
          )
        ],
      ),
    );
  }
}
