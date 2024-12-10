import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tictic/firebase_options.dart';
import 'package:tictic/screens/home/home.dart';
import 'package:tictic/screens/welcome.dart';
import 'package:tictic/styles/colors.dart';
import 'package:tictic/styles/fonts.dart';
import 'package:tictic/styles/spacings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.setLanguageCode("fr");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kMainColor,
          foregroundColor: kBackgroundColor,
          extendedTextStyle: kButtonStyle,
        ),
        colorScheme: const ColorScheme(
          primary: kMainColor,
          secondary: kSecondaryColor,
          surface: kBackgroundColor,
          error: kErrorColor,
          onPrimary: kBackgroundColor,
          onSecondary: kBackgroundColor,
          onSurface: kMainColor,
          onError: kMainColor,
          brightness: Brightness.dark,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(kMainColor),
            foregroundColor: WidgetStateProperty.all(kBackgroundColor),
            textStyle: WidgetStateProperty.all(kButtonStyle),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
                vertical: kVerticalPaddingS,
              ),
            ),
          ),
        ),
        useMaterial3: true,
      ),
      home:
          FirebaseAuth.instance.currentUser != null ? const Home() : const Welcome(),
    );
  }
}
