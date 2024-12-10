import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tictic/contents/firebase_auth_exception_messages.dart';
import 'package:tictic/screens/home/home.dart';
import 'package:tictic/utils/validations.dart';
import 'package:tictic/widgets/button.dart';
import 'package:tictic/widgets/error_message.dart';
import 'package:tictic/widgets/password_input.dart';
import 'package:tictic/widgets/text_input.dart';

import '../../styles/spacings.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  String _firstName = "Ada";

  String _lastName = "Lovelace";

  String _email = "ada@example.com";

  String _password = "1234567890";

  String _error = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
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
                return validateString(value, 'Prénom');
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
                return validateString(value, 'Nom');
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
          ErrorMessage(error: _error),
          const SizedBox(height: kVerticalPaddingS),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button(
                  onTap: () async {
                    if (_registerFormKey.currentState != null &&
                        _registerFormKey.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: _email, password: _password);

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                      } on FirebaseAuthException catch (firebaseAuthException) {
                        debugPrint(
                            'Failed to create user: $FirebaseAuthException');
                        setState(() {
                          _error = kFirebaseAuthExceptionMessage[
                              firebaseAuthException.code]!;
                        });
                      }
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
