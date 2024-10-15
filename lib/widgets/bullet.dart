import 'package:flutter/material.dart';
import 'package:tictic/styles/others.dart';

import '../styles/colors.dart';
import '../styles/spacings.dart';

class Bullet extends StatelessWidget {
  final List<String> items;

  final bool isActif;

  const Bullet({required this.items, this.isActif = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kVerticalPadding),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.all(Radius.circular(kBorderRadius)),
            color: isActif ? kMainColor : kBackgroundColor,
            boxShadow: [kShadow]),
        height: kBulletHeight,
        width: (MediaQuery.of(context).size.width - kHorizontalPaddingXXL) /
            items.length,
      ),
    );
  }
}
