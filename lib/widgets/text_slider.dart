import 'package:flutter/material.dart';

import '../styles/fonts.dart';
import '../styles/spacings.dart';

class TextSlider extends StatelessWidget {
  final List<String> items;
  final ValueChanged<int>? onPageChanged;
  final PageController pageController;

  const TextSlider(
      {required this.items,
      required this.pageController,
      this.onPageChanged,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: items.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Text(
              textAlign: TextAlign.center,
              item,
              style: kItalicText,
            ),
          );
        }).toList(),
      ),
    );
  }
}
