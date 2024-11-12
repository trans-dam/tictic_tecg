import 'package:flutter/material.dart';
import 'package:tictic/widgets/button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Button(
            label: 'Je me déconnecte',
            onTap: () {
              Navigator.of(context).pop();
            }),
      ),
    );
  }
}
