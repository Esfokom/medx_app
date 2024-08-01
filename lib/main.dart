import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medx/AuthWrapper.dart';
import 'package:medx/providers/doctor_provider.dart';
import 'package:medx/providers/user_provider.dart';
import 'package:medx/screens/Medical/new_record.dart';
import 'package:medx/screens/Medical/medical_screens.dart';
import 'package:medx/screens/Onboarding.dart';
import 'package:medx/screens/Personal/personal_screens.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DoctorProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'MedX',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
          primaryColor: Colors.redAccent,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(Colors.white),
              backgroundColor: WidgetStateProperty.all(Colors.red),
              minimumSize: WidgetStateProperty.all(
                const Size(250, 50),
              ),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
          ),
          useMaterial3: true,
        ),
        home: const AuthWrapper(),
        routes: {
          'personal': (context) => const PersonalScreen(),
          'medical': (context) => const MedicalScreen(),
          'medical/login': (context) => const MedicalLogin(),
          'medical/signup': (context) => const MedicalSignup(),
          'medical/main': (context) => const MedicalMainScreen(),
          'personal/login': (context) => const PersonalLogin(),
          'personal/signup': (context) => const PersonalSignup(),
          'personal/main': (context) => const PersonalMainScreen(),
          'onboarding': (context) => const OnboardingScreen(),
          'profile_screen_med': (context) => const ProfileScreenMed(),
          'patient_database': (context) => const PatientDatabase(),
          'id_search': (context) => const IdSearch(),
          'medical_patient_profile': (context) => const MedicalPatientProfile(),
          'patient_record': (context) => const PatientRecord(),
          'patient_request': (context) => const PatientRequest(),
          'personal_patients': (context) => const PersonalPatients(),
          'requests': (context) => const Requests(),
          'new_record': (context) => const NewRecord(),
          'personal_profile': (context) => const PersonalProfile(),
          'medical_data': (context) => const MedicalData(),
          'records': (context) => const Records(),
        },
      ),
    );
  }
}
