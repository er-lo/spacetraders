import 'package:flutter/material.dart';
import 'src/screens/register_faction.dart';
import 'src/screens/splash_page.dart';
import 'src/screens/sign_in.dart';
import 'src/screens/register.dart';
import 'src/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const SplashPageScreen(),
        '/sign_in' : (context) => const SignInScreen(),
        '/register' : (context) => const RegisterScreen(),
        '/register_faction' : (context) => const RegisterFactionScreen(),
      },
    );
  }
}