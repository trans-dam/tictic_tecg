import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictic/styles/spacings.dart';

class Welcome extends StatelessWidget {
  Welcome({super.key});

  final List<String> _items = [
    'L’harmonie financière dans vos groupes, en toute simplicité !',
    'Calculs instantanés, équité garantie avec TicTic !',
    'Calculs fastidieux ? Non merci. Optez pour la simplicité avec TicTic !',
    'TicTic : Vos dépenses partagées en toute simplicité !',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/img/back1.png",
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/logo.svg",
                  height: MediaQuery.of(context).size.height * kLogoRatio,
                  semanticsLabel: 'Logo TicTic'),
              const SizedBox(
                height: kVerticalPaddingL,
              ),
              // TODO : fix this !
              SizedBox(
                height: 60,
                child: PageView(
                  children: _items.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kHorizontalPadding),
                      child: Text(item),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
