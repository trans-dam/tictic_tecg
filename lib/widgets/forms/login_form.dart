import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tictic/screens/home/home.dart';
import 'package:tictic/utils/validations.dart';
import 'package:tictic/widgets/button.dart';
import 'package:tictic/widgets/password_input.dart';
import 'package:tictic/widgets/text_input.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  String _email = "ada@example.com";
  String _password = "1234567890";

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
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: _email,
                        password: _password,
                      ).then((value) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                      }).catchError((error) {
                        debugPrint(error);
                      });
                    }
                  },
                  label: 'Je me connecte'),
            ],
          )
        ],
      ),
    );
  }
}
