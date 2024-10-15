import 'package:flutter/material.dart';
import 'package:tictic/styles/spacings.dart';
import 'package:tictic/widgets/bullet.dart';

class Bullets extends StatelessWidget {
  final List<String> items;
  final PageController pageController;
  final int currentSliderIndex;

  const Bullets(
      {required this.pageController,
      required this.currentSliderIndex,
      required this.items,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              //pageController.jumpToPage(_items.indexOf(item));

              pageController.animateToPage(
                items.indexOf(item),
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeIn,
              );
            },
            child: Bullet(
              isActif: items.indexOf(item) == currentSliderIndex ? true : false,
              items: items,
            ),
          );
        }).toList(),
      ),
    );
  }
}
