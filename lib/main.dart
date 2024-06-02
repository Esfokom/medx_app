import 'package:flutter/material.dart';
import 'package:medx/screens/Onboarding.dart';
import 'package:medx/screens/Medical/medical_screens.dart';
import 'package:medx/screens/Personal/personal_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        primaryColor: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(Colors.white),
            backgroundColor: WidgetStateProperty.all(Colors.red),
            minimumSize: WidgetStateProperty.all(
              const Size(250, 50),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),

        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
      routes: {
        'onboarding': (context) => OnboardingScreen(),
        'personal': (context) => PersonalScreen(),
        'medical': (context) => MedicalScreen(),
        'medical_login': (context) => MedicalLogin(),
        'medical_signup': (context) => MedicalSignup(),
        'medical_main_screen': (context) => MedicalMainScreen(),
      },
    );
  }
}
