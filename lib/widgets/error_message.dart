import 'package:flutter/material.dart';
import 'package:tictic/styles/others.dart';
import 'package:tictic/styles/spacings.dart';

import '../styles/colors.dart';

class ErrorMessage extends StatelessWidget {
  final String error;

  const ErrorMessage({required this.error, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: error.isEmpty ? 0 : kVerticalPaddingS,
        horizontal: error.isEmpty ? 0 : kHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(kBorderRadius),
        boxShadow: error.isEmpty ? [] : [kShadow],
      ),
      child: Text(
        error,
        style: const TextStyle(
            color: kBackgroundColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
