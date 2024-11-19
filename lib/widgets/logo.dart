import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictic/screens/welcome.dart';

import '../contents/textes.dart';
import '../styles/spacings.dart';

class Logo extends StatelessWidget {
  final bool navigateToWelcome;

  const Logo({this.navigateToWelcome = true, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateToWelcome
          ? () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Welcome(),
                ),
              );
            }
          : () {},
      child: SvgPicture.asset("assets/icons/logo.svg",
          height: MediaQuery.of(context).size.height * kLogoRatio,
          semanticsLabel: kSemanticsLabelLogo),
    );
  }
}
