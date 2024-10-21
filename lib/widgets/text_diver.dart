import 'package:flutter/material.dart';
import 'package:tictic/styles/fonts.dart';
import 'package:tictic/widgets/line_text.dart';

import '../../styles/spacings.dart';

@immutable
class TextDivider extends StatelessWidget {
  const TextDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: kVerticalPaddingL),
      child: Row(
        children: [
          LineText(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child:
                Text('Ou', textAlign: TextAlign.center, style: kTextDiverStyle),
          ),
          LineText(),
        ],
      ),
    );
  }
}
