import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictic/contents/textes.dart';
import 'package:tictic/screens/register.dart';
import 'package:tictic/styles/spacings.dart';
import 'package:tictic/widgets/bullets.dart';
import 'package:tictic/widgets/button.dart';
import 'package:tictic/widgets/text_diver.dart';
import 'package:tictic/widgets/text_slider.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int currentSliderIndex = 0;

  final PageController _pageController = PageController();

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
              Spacer(),
              SvgPicture.asset("assets/icons/logo.svg",
                  height: MediaQuery.of(context).size.height * kLogoRatio,
                  semanticsLabel: kSemanticsLabelLogo),
              Spacer(),
              const SizedBox(
                height: kVerticalPaddingL,
              ),
              TextSlider(
                pageController: _pageController,
                onPageChanged: _onPageChanged,
                items: kWelcomeMessages,
              ),
              const SizedBox(
                height: kVerticalPadding,
              ),
              Bullets(
                items: kWelcomeMessages,
                pageController: _pageController,
                currentSliderIndex: currentSliderIndex,
              ),
              const SizedBox(
                height: kVerticalPadding,
              ),
              Spacer(),
              Button(
                label: kLoginWithoutAccount,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ),
                  );
                },
              ),
              Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                  child: TextDivider(),
                ),
                SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          onTap: () =>{},
                          label: 'Je me connecte',
                        ),
                        const SizedBox(
                          width: kHorizontalPadding,
                        ),
                        Button(
                          onTap: () =>
                          {},
                          label: 'Créer mon compte',
                        )
                      ],
                    ),
                  ),
                )
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
