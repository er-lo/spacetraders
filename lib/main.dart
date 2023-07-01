import 'package:flutter/material.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const RegisterScreen(),
        '/sign_in' : (context) => const SignInScreen(),
      },
    );
  }
}