import 'package:flutter/material.dart';
import 'package:tictic/screens/welcome.dart';
import 'package:tictic/styles/colors.dart';
import 'package:tictic/styles/fonts.dart';
import 'package:tictic/styles/spacings.dart';
import 'package:tictic/widgets/buttons/back_button.dart' as back_button;
import 'package:tictic/widgets/forms/register.dart';
import 'package:tictic/widgets/logo.dart';

class FormLayout extends StatelessWidget {
  final Widget form;
  final String label;
  final Widget link;

  const FormLayout(
      {required this.form, required this.label, required this.link, super.key});

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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
