import 'package:flutter/material.dart';
import 'package:tictic/screens/password_forgot.dart';
import 'package:tictic/styles/fonts.dart';
import 'package:tictic/styles/spacings.dart';
import 'package:tictic/widgets/buttons/back_button.dart' as back_button;
import 'package:tictic/widgets/logo.dart';

class FormLayout extends StatelessWidget {
  final Widget form;
  final String label;
  final Widget link;
  final bool addForgotPassword;

  const FormLayout(
      {required this.form,
      required this.label,
      required this.link,
      this.addForgotPassword = false,
      super.key});

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
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const back_button.BackButton(),
                      const Logo(),
                      const SizedBox(height: kVerticalPaddingL),
                      form,
                      const SizedBox(height: kVerticalPaddingL),
                      Text(
                        label,
                        style: kLabelStyle.apply(fontStyle: FontStyle.italic),
                      ),
                      link,
                      const Spacer(),
                      addForgotPassword
                          ? TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PasswordForgot(),
                                  ),
                                );
                              },
                              child: Text(
                                'Mot de passe oublié ?',
                                style: kLabelStyle.apply(
                                  fontStyle: FontStyle.italic,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
