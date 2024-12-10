import 'package:flutter/material.dart';
import 'package:tictic/styles/others.dart';
import 'package:tictic/styles/spacings.dart';

import '../styles/colors.dart';

class ErrorMessage extends StatelessWidget {
  final String error;

  const ErrorMessage({required this.error, super.key});

  @override
  Widget build(BuildContext context) {
    return error.isNotEmpty
        ? Container(
            padding: const EdgeInsets.symmetric(
              vertical: kVerticalPaddingS,
              horizontal: kHorizontalPadding,
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(kBorderRadius),
              boxShadow: [kShadow],
            ),
            child: Text(
              error,
              style: const TextStyle(
                  color: kBackgroundColor, fontWeight: FontWeight.bold),
            ),
          )
        : Container();
  }
}
