import 'package:flutter/material.dart';
import 'package:tictic/styles/colors.dart';
import 'package:tictic/styles/fonts.dart';
import 'package:tictic/styles/others.dart';
import 'package:tictic/styles/spacings.dart';

class Button extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String label;

  final bool isPrimary;

  const Button(
      {required this.label, this.onTap, this.isPrimary = true, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding, vertical: kVerticalPaddingS),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: isPrimary ? kMainColor : kBackgroundColor,
        ),
        child: Text(
          label,
          style: kButtonStyle.apply(
              color: isPrimary ? kBackgroundColor : kMainColor),
        ),
      ),
    );
  }
}
