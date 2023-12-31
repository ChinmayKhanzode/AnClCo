import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ordering/auth_gate.dart';
import 'package:food_ordering/screens/splashScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_ordering/screens/tabs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 255, 122, 60),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: "AnClCo",
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          }

          if (snapshot.hasData) {
            return Tabs();
          }
          return AuthGate();
        },
      ),
    );
  }
}
