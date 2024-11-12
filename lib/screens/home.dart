import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tictic/screens/welcome.dart';
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
              FirebaseAuth.instance.signOut();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Welcome(),
                ),
              );
            }),
      ),
    );
  }
}
