import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictic/styles/spacings.dart';
import 'package:tictic/widgets/bullets.dart';
import 'package:tictic/widgets/text_slider.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int currentSliderIndex = 0;

  final PageController _pageController = PageController();

  final List<String> _items = [
    'L’harmonie financière dans vos groupes, en toute simplicité !',
    'Calculs instantanés, équité garantie avec TicTic !',
    'Calculs fastidieux ? Non merci. Optez pour la simplicité avec TicTic !',
    'TicTic : Vos dépenses partagées en toute simplicité !',
  ];

  _onPageChanged(index) {
    setState(() {
      currentSliderIndex = index;
    });
  }

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
              TextSlider(
                pageController: _pageController,
                onPageChanged: _onPageChanged,
                items: _items,
              ),
              const SizedBox(
                height: kVerticalPadding,
              ),
              Bullets(
                items: _items,
                pageController: _pageController,
                currentSliderIndex: currentSliderIndex,
              )
            ],
          ),
        ),
      ),
    );
  }
}
