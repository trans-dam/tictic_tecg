import 'package:flutter/material.dart';
import 'package:tictic/screens/home.dart';
import 'package:tictic/utils/validations.dart';
import 'package:tictic/widgets/button.dart';
import 'package:tictic/widgets/password_input.dart';
import 'package:tictic/widgets/text_input.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  String _firstName = "Ada";
  String _lastName = "Lovelace";
  String _email = "ada@example.com";
  String _password = "1234567890";

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextInput(
              prefixIcon: Icons.person,
              hintText: 'Alex',
              labelText: 'Prénom',
              keyboardType: TextInputType.name,
              initialValue: _firstName,
              onChanged: (value) {
                _firstName = value;
              },
              validator: (value) {
                return validateName(value, 'Prénom');
              },
              tooltipMessage: 'Votre prénom sera visible par vos amis'),
          TextInput(
              prefixIcon: Icons.person,
              hintText: 'Duchant',
              labelText: 'Nom',
              initialValue: _lastName,
              onChanged: (value) {
                _lastName = value;
              },
              keyboardType: TextInputType.name,
              validator: (value) {
                return validateName(value, 'Nom');
              },
              tooltipMessage: 'Votre nom permet d’éviter les homonymes'),
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
          PasswordInput(
            initialValue: _password,
            onChanged: (value) {
              _password = value;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button(
                  onTap: () async {
                    if (_registerFormKey.currentState != null &&
                        _registerFormKey.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    }
                  },
                  label: 'Créer mon compte'),
            ],
          )
        ],
      ),
    );
  }
}
