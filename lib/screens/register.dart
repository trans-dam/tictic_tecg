import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictic/screens/home.dart';
import 'package:tictic/styles/colors.dart';
import 'package:tictic/styles/spacings.dart';
import 'package:tictic/utils/validations.dart';
import 'package:tictic/widgets/button.dart';
import 'package:tictic/widgets/password_input.dart';
import 'package:tictic/widgets/text_input.dart';

class Register extends StatelessWidget {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  String _firstName = "Ada";
  String _lastName = "Lovelace";
  String _email = "ada@example.com";
  String _password = "1234567890";

  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/back1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: Form(
                key: _registerFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                          color: kMainColor,
                        ),
                      ],
                    ),
                    SvgPicture.asset("ressources/icons/logo.svg",
                        height: MediaQuery.of(context).size.height * kLogoRatio,
                        semanticsLabel: 'Logo TicTic'),
                    const SizedBox(
                      height: kVerticalPaddingL,
                    ),
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
                        tooltipMessage:
                            'Votre prénom sera visible par vos amis'),
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
                        tooltipMessage:
                            'Votre nom permet d’éviter les homonymes'),
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
