import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/providers/shared_preferences.dart';
import 'core/themes/theme.dart';
import 'presentation/pages/onboarding_page.dart';
import 'presentation/pages/wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();

  runApp(ProviderScope(
    overrides: [
      sharedPreferences.overrideWithValue(preferences),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: primaryColor,
        ),
        fontFamily: 'Poppins',
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: grey300Color,
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: grey300Color),
          ),
        ),
        useMaterial3: false,
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          showCloseIcon: true,
          closeIconColor: Colors.white,
          contentTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      routes: {
        '/': (context) => const Wrapper(),
        '/onboarding': (context) => const OnboardingPage(),
      },
      initialRoute: '/',
    );
  }
}