import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../welcome.dart';

class BurgerMenu extends StatelessWidget {
  const BurgerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text('Déconnexion'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Welcome(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
