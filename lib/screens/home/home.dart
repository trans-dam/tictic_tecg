import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictic/screens/home/widgets/burger_menu.dart';
import 'package:tictic/styles/spacings.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SvgPicture.asset(
            'assets/icons/logo.svg',
            width: kLogoSize,
          ),
          const SizedBox(width: kHorizontalPadding),
        ],
      ),
      drawer: const BurgerMenu(),
      body: Center(
        child: Center(
          child: Text(FirebaseAuth.instance.currentUser!.email!),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text(
          "Créer un groupe",
        ),
      ),
    );
  }
}


